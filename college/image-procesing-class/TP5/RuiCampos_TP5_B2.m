%% create signals
n  = 0:255;
xo = RuiCampos_TP5_signalObj(n, 0.2*n.*exp(-0.03*n));
rA = RuiCampos_TP5_signalObj(n, (cos(0.81*pi*n) + cos(0.85*pi*n)...
                               + cos(0.91*pi*n) + cos(0.95*pi*n)) / 4);
          
xA = RuiCampos_TP5_signalObj(n, xo.x + rA.x); 

SIGNALS = [xo, xA];
%% filter xA
xA_fft_cut = [xA.fft(1:256/4)     ,...
              zeros(1, 256/2-1)   ,...
              xA.fft(256*3/4:256)];

xA_cut = RuiCampos_TP5_signalObj(n, ifft(xA_fft_cut));
xA_cut.fft_abs = log10(abs(xA_fft_cut));
SIGNALS = [SIGNALS, xA_cut];
%% plot
TITULOS = ["Sinal Original",...
           "Sinal Original + Ruido",...
           "Sinal Filtrado c/ LP ideal",...
           "DFT do Sinal Original",...
           "DFT do Sinal Original + Ruido",...
           "DFT do Sinal Filtrado c/ LP ideal"];
figure
for i=1:3
    subplot(2,3,i)
    SIGNALS(i).plot
    title(TITULOS(i))
end
for i=4:6
    subplot(2,3,i)
    SIGNALS(i-3).plot_fft2
    title(TITULOS(i))
end