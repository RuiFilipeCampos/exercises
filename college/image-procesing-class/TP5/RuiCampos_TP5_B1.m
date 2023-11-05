%% (i)
n  = 0:255;
xo = RuiCampos_TP5_signalObj(n, 0.2*n.*exp(-0.03*n));
rA = RuiCampos_TP5_signalObj(n, (cos(0.81*pi*n) + cos(0.85*pi*n)...
                               + cos(0.91*pi*n) + cos(0.95*pi*n)) / 4);
          
rB = RuiCampos_TP5_signalObj(n, rand(1,256)*.8-.4);

xA = RuiCampos_TP5_signalObj(n, xo.x + rA.x); 
xB = RuiCampos_TP5_signalObj(n, xo.x + rB.x); 
xC = RuiCampos_TP5_signalObj(n, xo.x + rA.x + rB.x);

SIGNALS = [xo, rA, rB, xA, xB, xC];

TITULOS = ["Sinal Original",...
            "Ruído A", "Ruido B",...
            "Sinal Original + Ruido A",...
            "Sinal Original + Ruido B",...
            "Sinal Original + Ruido A + Ruido B"];
        
figure('Name','Sinais no Domínio Temporal')
for i=1:6
    subplot(2,3,i)
    SIGNALS(i).plot
    title(TITULOS(i))
end

%% (ii)
figure('Name', 'DFT de xA')
subplot(2,3,1), plot(xA.w/pi, xA.fft_abs)
xlabel('w/\pi'),ylabel('DFT Amplitude(log10)')
title('Valor Absoluto da DFT entre 0 e 2\pi')

subplot(2,3,2), plot((xA.w/pi)-1, fftshift(xA.fft_abs))
xlabel('w/\pi'),ylabel('DFT Amplitude(log10)')
title('Valor Absoluto da DFT entre -\pi e \pi')

subplot(2,3,3), xA.plot_fft
title('Valor Absoluto da DFT entre 0 e \pi')

subplot(2,3,4), plot(xA.w/pi, xA.fft_pha)
xlabel('w/\pi'),ylabel('DFT Fase(rad)')
title('DFT fase entre 0 e 2\pi')

subplot(2,3,5), plot((xA.w/pi)-1, fftshift(xA.fft_pha))
xlabel('w/\pi'),ylabel('DFT Fase(rad)')
title('DFT fase entre -\pi e \pi')

subplot(2,3,6), plot(xA.w(1:xA.N/2)/pi, xA.fft_pha(1:xA.N/2))
xlabel('w/\pi'),ylabel('DFT Fase(rad)')
title('DFT fase entre 0 e \pi')

%% (iiI)
figure('Name','Sinais no Domínio de Frequência')
for i=1:6
    subplot(2,3,i)
    SIGNALS(i).plot_fft
    title(TITULOS(i))
end
