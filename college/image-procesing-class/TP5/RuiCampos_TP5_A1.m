%% creating signals and applying DFT
N  = 256;
n  = 0:N-1;
x1 = 2*n.*(0.9.^n);    TF1 = fft(x1);
x2 = cos(6 *pi*n/N);   TF2 = fft(x2);
x3 = cos(15*pi*n/N);   TF3 = fft(x3);
%% graphing
figure('Name', 'A1')
subplot(3,3,1), plot(n, x1), title('Sinal 1'), xlabel('n'), ylabel('x_1[n]')
subplot(3,3,4), plot(n, x2), title('Sinal 2'), xlabel('n'), ylabel('x_2[n]')
subplot(3,3,7), plot(n, x3), title('Sinal 3'), xlabel('n'), ylabel('x_3[n]')

subplot(3,3,2), plot(2*n/N, abs(TF1)), title('Sinal 1 - Módulo DFT'), xlabel('w/\pi'), ylabel('|X_1(e^{jw})|')
subplot(3,3,5), plot(2*n/N, abs(TF2)), title('Sinal 2 - Módulo DFT'), xlabel('w/\pi'), ylabel('|X_2(e^{jw})|')
subplot(3,3,8), plot(2*n/N, abs(TF3)), title('Sinal 3 - Módulo DFT'), xlabel('w/\pi'), ylabel('|X_3(e^{jw})|')

subplot(3,3,3), plot(2*n/N, angle(TF1)), title('Sinal 1 - Fase DFT'), xlabel('w/\pi'), ylabel('arg [ X_1(e^{jw}) ]')
subplot(3,3,6), plot(2*n/N, angle(TF2)), title('Sinal 2 - Fase DFT'), xlabel('w/\pi'), ylabel('arg [ X_2(e^{jw}) ]')
subplot(3,3,9), plot(2*n/N, angle(TF3)), title('Sinal 3 - Fase DFT'), xlabel('w/\pi'), ylabel('arg [ X_3(e^{jw}) ]')