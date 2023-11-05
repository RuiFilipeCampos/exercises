EEGdata = importdata('EEG.mat');
EEG     = RuiCampos_TP6_signalObj(EEGdata, 100);

%% applying filter
Fpass1 = EEG.HzToNorm(5);
Fpass2 = EEG.HzToNorm(15);
[b, a] = butter(6, [Fpass1, Fpass2]);        % Bandpass digital filter design

EEG_Y = filter(b, a, EEG.Y);
EEGfilt = RuiCampos_TP6_signalObj(EEG_Y, 100);
%% comparing results
figure
subplot(2,1,1), EEG.plot_time,     title("Sinal Original")
subplot(2,1,2), EEGfilt.plot_time, title("Sinal Filtrado")

figure('Name', 'Frequency Response of Filter')
freqz(b,a)