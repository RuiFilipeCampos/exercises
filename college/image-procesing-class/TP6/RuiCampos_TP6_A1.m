EEGdata = importdata('EEG.mat');
EEG     = RuiCampos_TP6_signalObj(EEGdata, 100);

figure
subplot(2,1,1),EEG.plot_time, title("Sampled Signal")
subplot(2,1,2),EEG.plot_fftABS("Hz"), title("DFT of EEG signal")