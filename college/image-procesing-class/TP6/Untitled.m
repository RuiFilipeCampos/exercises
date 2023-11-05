
EEGdata = importdata('EEG.mat');
[Y, FS] = audioread('Canto1.mp3');

EEG = RuiCampos_TP6_signalObj(EEGdata, 0.100);
canto = RuiCampos_TP6_signalObj(Y(:,1), FS);

figure
subplot(1,3,1)
canto.plot_fftABS("Hz")
subplot(1,3,2)
canto.plot_fftABS("kHz")
subplot(1,3,3)
canto.plot_fftPHA()
