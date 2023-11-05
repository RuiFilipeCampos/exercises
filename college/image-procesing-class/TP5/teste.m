%% create signals
n  = 0:255;
xo = 0.2*n.*exp(-0.03*n);

rA = (cos(0.81*pi*n) + cos(0.85*pi*n)...
    + cos(0.91*pi*n) + cos(0.95*pi*n)) / 4 ;

xA = xo + rA;
ER = norm(x-xo,2)/norm(xo,2);
%% filter
w = 2*pi*n/256;
[num,den] = RuiCampos_TP5_C2_plotFlter(LP, w, 1);
xA_cut = filter(num,den,xA);
ERbu = norm(xA_cut-xo,2)/norm(xo,2);
%% ideal filter
xA_fft_cut = [xA_fft(1:256/4)     ,...
              zeros(1, 256/2-1)   ,...
              xA_fft(256*3/4:256)];

xA_cut_ideal = ifft(xA_fft_cut);
xo_fft = fft(xo);
ERbu = norm(xA_cut_ideal-xo,2)/norm(xo,2);
%% plot
figure('Name', 'B2')
subplot(2,2,1),plot(n,xo)    ,xlabel('n'),title('Sinal Original')
subplot(2,2,2),plot(n,xA)    ,xlabel('n'),title('Sinal com Ruído')

subplot(2,2,3),plot(n,xA_cut_ideal),xlabel('n'),title('Sinal Filtrado 1')
subplot(2,2,4),plot(n,xA_cut),xlabel('n'),title('Sinal Filtrado 2')


