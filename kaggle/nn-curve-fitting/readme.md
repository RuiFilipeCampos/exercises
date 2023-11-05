**Problem**: Fit a series of (x, y) points using a neural network. Fit must be within absolute distance of 0.1 for 95% of the data.

**Approach**: To accelarate convergence, I leveraged the low dimensionality of the problem by implementing a layer that generates fourier and tailor features from the data. That is, it transforms the input y value into a vector of the form `[y, y**2, ...n y**n, cos(y], cos(2*y), ..., cos(n*y), sin(y), sin(2*y), ..., sin(n*y)]`. By experimentation, I've found that a single layer architecture works best. The tailor-fourier features vector is rich in information and is high dimensional. A large dense layer is enough to learn this info but keeps the number of weight updates low enough to allow for a timely convergence.

The approach is very powerful, starting from a very low learning rate is critical.

I've used exponential decay schedule starting at about 1e-4 or 1e-5 lr.
