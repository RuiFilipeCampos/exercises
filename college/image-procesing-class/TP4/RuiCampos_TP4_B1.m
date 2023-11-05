%% create sequences
n = 0:70;
s = 2*n.* 0.9.^n;     %true signal
r = .8*rand(1,71)-.4; %noise
x = r+s;              %noisy signal

ER = RuiCampos_TP4_A3(s,x);
%% plot
figure
hold on

plot(n, s),plot(n, r),plot(n, x)
xlabel('n'),ylabel('Amplitude do Sinal')

titulo = "Erro de aprox. de x[n] a s[n] = " + string(ER);
title(char(titulo))

legend("s[n] - sinal",        ...
       "r[n] - ruído",        ...
       "x[n] - sinal + ruído",...
       'Location', 'Best')