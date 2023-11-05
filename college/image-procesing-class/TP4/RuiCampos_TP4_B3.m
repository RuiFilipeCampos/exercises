%% create sequences
n = 0:70;
s = 2*n.* 0.9.^n;     %true signal

r = .8*rand(1,71)-.4; %noise
x = r+s;              %noisy signal
%% apply filter
avg5   = [1 1 1 1 1]/5;
y5     = filter(avg5, 1, x);
y5corr = zeros(1,71);
for i=1:69
    y5corr(i) = y5(i+2);
end
%% calculating errors
ERx  = RuiCampos_TP4_A3(s,x);      ERx  = string(ERx);
ERy5 = RuiCampos_TP4_A3(s,y5corr); ERy3 = string(ERy5);
%% plot
figure,hold on
plot(n, s), plot(n, x), plot(n, y5corr)

legend({'s[n]',                 ...
        "x[n]:   ER = " + ERx,  ...
        "y5[n]: ER = "  + ERy5},... 
        'Location', 'best')
    
xlabel('n'), ylabel('Signal Amplitude')
title('Comparaçao de sinal Original, Ruidoso e Média 5 pontos Corrigido')
