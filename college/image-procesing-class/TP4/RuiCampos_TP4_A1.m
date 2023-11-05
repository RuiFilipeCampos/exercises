%% create signal/calculate energy
A=1.9 ; C=-0.1+0.2*pi*1i; n = 1:40;
x = A*exp(C*n);
E = sum(abs(x).^2);
%% figure
figure
subplot(2,2,1), stem(n, real(x))
title('Real Component'), xlabel('n'), ylabel('Re(x[n])')

subplot(2,2,2), stem(n, imag(x))
title('Imaginary Component'), xlabel('n'), ylabel('Im(x[n])')

subplot(2,2,3), stem(n, abs(x))
title("Absolute Value (E=" + string(E) + ")"), xlabel('n'), ylabel('|x[n]|')

subplot(2,2,4), stem(n, angle(x))
title('Phase'), xlabel('n'), ylabel('phase of x[n] (rad)')