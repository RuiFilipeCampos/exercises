%% (i) - creat signals, graph
n  = 0:255;
xo = 0.2*n.*exp(-0.03*n);

rA = (cos(0.81*pi*n) + cos(0.85*pi*n)...
    + cos(0.91*pi*n) + cos(0.95*pi*n)) / 4 ;

rB = rand(1,256)*.8-.4;

xA = xo + rA; 
xB = xo + rB; 
xC = xo + rA + rB;

figure
subplot(2,3,1), plot(n,xo), xlabel('n'), ylabel('Amplitude'), title('Sinal Original')
subplot(2,3,2), plot(n,rA), xlabel('n'), ylabel('Amplitude'), title('Ruido A')
subplot(2,3,3), plot(n,rB), xlabel('n'), ylabel('Amplitude'), title('Ruido B')
subplot(2,3,4), plot(n,xA), xlabel('n'), ylabel('Amplitude'), title('Sinal Original + Ruido A')
subplot(2,3,5), plot(n,xB), xlabel('n'), ylabel('Amplitude'), title('Sinal Original + Ruido B')
subplot(2,3,6), plot(n,xC), xlabel('n'), ylabel('Amplitude'), title('Sinal Original + Ruido A + Ruido B')
%% (ii) - DFT de xa
xA_fft     = fft(xA);
xA_fft_abs = log10(abs(xA_fft));
xA_fft_pha = angle(xA_fft);

w  = 2*pi*n/256;  %[0,2[  ~ [0, 2pi[
w2 = w - 1;    %[-1,1[ ~ [-pi, pi[

figure('Name', 'DFT de xA')
subplot(2,3,1), plot(w/pi,xA_fft_abs), xlabel('w/ \pi'),ylabel('log10(|X_A(jw)|)')
subplot(2,3,2), plot(w2,fftshift(xA_fft_abs))
subplot(2,3,3), plot(w(1:125), xA_fft_abs(1,1:125));

subplot(2,3,4), plot(w, xA_fft_pha)
subplot(2,3,5), plot(w2,fftshift(xA_fft_pha))
subplot(2,3,6), plot(w(1,1:125), xA_fft_pha(1,1:125));

%% (iii)
xo_fft     = fft(xo);            rA_fft     = fft(rA);
xo_fft_abs = abs(xo_fft);        rA_fft_abs = abs(rA_fft);
%xo_fft_abs = xo_fft_abs(1:125);  rA_fft_abs = rA_fft_abs(1:125);

rB_fft     = fft(rB);            xB_fft     = fft(xB);
rB_fft_abs = abs(rB_fft);        xB_fft_abs = abs(rB_fft);     
%rB_fft_abs = rB_fft_abs(1:125);  %xB_fft_abs = xB_fft_abs(1:125);

xC_fft     = fft(xC);
xC_fft_abs = abs(xC_fft);
%xC_fft_abs = xC_fft_abs(1:125);

%xA_fft = fft(xA); xA_fft_abs = abs(xA_fft);
xA_fft_abs(1:125);
 
w = w(1:125);
figure
subplot(2,3,1), plot(w, xo_fft_abs(1:125)), title('Sinal Original(DFT)')
subplot(2,3,2), plot(w, rA_fft_abs(1:125)), title('Ruido A(DFT)')
subplot(2,3,3), plot(w, rB_fft_abs(1:125)), title('Ruido B(DFT)')
subplot(2,3,4), plot(w, xA_fft_abs(1:125)), title('x_a (DFT)')
subplot(2,3,5), plot(w, xB_fft_abs(1:125)), title('x_b (DFT)')
subplot(2,3,6), plot(w, xC_fft_abs(1:125)), title('x_c (DFT)')
