[Y, FS] = audioread('Canto1.mp3');
sinal = RuiCampos_TP6_signalObj(Y(:,1)', FS); %canal 1
%canto2 = RuiCampos_TP6_signalObj(Y(:,2)', FS); %canal 2

ruido = sinal(1:3);
canto = sinal(4:6); %custom slices! 
%% ploting
figure
subplot(2,1,1), sinal.plot_time, title("Sinal Original")
subplot(2,2,3), ruido.plot_time, title("Secção com Ruído de Fundo")
subplot(2,2,4), canto.plot_time, title("Secção com Canto")

figure
subplot(2,3,1),sinal.plot_time, title("Sinal Original")
subplot(2,3,2),ruido.plot_time, title("Secçao com Ruído de Fundo")
subplot(2,3,3),canto.plot_time, title("Secção com Canto")

subplot(2,3,4),sinal.plot_fftABS("kHz"), title("Sinal Original(DFT)")
subplot(2,3,5),ruido.plot_fftABS("kHz"), title("Secçao com Ruído de Fundo(DFT)")
subplot(2,3,6),canto.plot_fftABS("kHz"), title("Secção com Canto(DFT)")

%% spectrogram
figure
[~, F, T, P] = spectrogram(sinal.Y, 128, 96, 128, sinal.Fs);
surf(T, 1e-3*F, 10*log10(P), 'edgecolor', 'none');
axis tight
view(0,90)
ylabel Frequency(kHz)
xlabel Time(s)

%% slicing the signal and turning it into new signal objects
% [ruido, Fs, dt] = canto_.slice(1, 3);
% ruido = RuiCampos_TP6_signalObj(ruido, Fs);
% ruido.time_translation(dt)
% 
% [canto, Fs, dt] = canto_.slice(4,6);
% canto = RuiCampos_TP6_signalObj(canto, Fs);
% canto.time_translation(dt)

