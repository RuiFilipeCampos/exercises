"""
Fit (x, y) data using neural network, curve fit must be within 0-0.1 absolute error on at least 95% of data
"""

import tensorflow as tf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split 

BATCH_SIZE = 32
EPOCHS = 30

data = pd.read_csv("/kaggle/input/input-csv/Input_Data.csv")

class DataSet:
    y = np.array(data.pop("Y")).reshape(-1, 1)
    y_min = min(y)
    y_grounded = y - y_min
    y_max = max(abs(y_grounded))
    y_norm = (y_grounded / y_max)

    @classmethod
    def revert_y_norm(cls, y_norm):
        y_grounded = y_norm * cls.y_max
        return y_grounded + cls.y_min

    x = np.array(data.pop("X")).reshape(-1, 1)
    x_max = max(abs(x))
    x_norm = x / x_max
    x_theta = (np.pi*(x_norm - 0.5))

class FourierFeaturesLayer(tf.keras.layers.Layer):
    def __init__(self, n, **kwargs):
        super(FourierFeaturesLayer, self).__init__(**kwargs)
        self.n = n  # The number of frequency components to use

    def call(self, inputs: tf.Tensor, **kwargs):

        output_tensors = [inputs, inputs**2,  inputs**3, inputs**4]

        for i in range(0, self.n + 1):
            output_tensors.append(tf.cos(i*inputs))
            output_tensors.append(tf.sin(i*inputs))

        out =  tf.concat(output_tensors, axis=-1)
        return out

model = tf.keras.Sequential([
    # FourierFeaturesLayer(1),
    FourierFeaturesLayer(15),
    tf.keras.layers.Dense(15_000, activation="relu"),
    tf.keras.layers.Dense(1, activation="linear"),
])

@tf.function
def abs_diff(y_true, y_pred):
    y_true = DataSet.revert_y_norm(y_true)
    y_pred = DataSet.revert_y_norm(y_pred)
    return tf.reduce_sum(tf.abs(y_true - y_pred)) / BATCH_SIZE

# Exponential decay schedule
initial_learning_rate = 0.0001
lr_schedule = tf.keras.optimizers.schedules.ExponentialDecay(
    initial_learning_rate,
    decay_steps=1000,
    decay_rate=0.96,
    staircase=True
)

# Pass this schedule to the optimizer
optimizer = tf.keras.optimizers.Adam(learning_rate=lr_schedule, amsgrad=True)

model.compile(
    loss="mse",
    optimizer=optimizer,
    metrics=[abs_diff, "mae", "mse"],
)

x_train, x_val, y_train, y_val = train_test_split(
    DataSet.x_theta,
    DataSet.y_norm,
    test_size=0.05,
    random_state=42
)


class PrintLearningRate(tf.keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs=None):
        lr = tf.keras.backend.get_value(self.model.optimizer.lr)
        print(f"\nEpoch {epoch + 1}: Learning rate is {lr:.6f}.")

print_lr_callback = PrintLearningRate()

history = model.fit(
    x_train,
    y_train,
    validation_data=(x_val, y_val),
    batch_size=BATCH_SIZE,
    callbacks=[print_lr_callback],
    epochs=EPOCHS,
)

plt.figure(figsize=(15,15))
y = model(DataSet.x_theta)

print(y)
y = np.array(y)

plt.plot(DataSet.x, DataSet.y, color="red")
plt.scatter(DataSet.x, DataSet.revert_y_norm(y))
