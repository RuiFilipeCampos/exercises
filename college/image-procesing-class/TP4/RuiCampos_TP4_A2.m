function [E,L1,L2,L3,Linf]=RuiCampos_TP4_A2(x)
E  = sum(abs(x).^2);

L1 = norm(x,1); 
L2 = norm(x,2); 
L3 = norm(x,3); 

Linf = norm(x, Inf);

%% figure
figure, hold on
stem(real(x))
stem(imag(x))
title('Signal'), ylabel('Amplitude'), xlabel('n')
legend("Component Real", "Componente Imaginária",...
    'Location', 'Best')
end

