%% create sequences
n = 0:70;
s = 2*n.* 0.9.^n;     %true signal
r = .8*rand(1,71)-.4; %noise
x = r+s;              %noisy signal
%% filters
avg3 = [1 1 1]/3;
avg5 = [1 1 1 1 1]/5;
%% applying filters to x
y3 = filter(avg3, 1, x);
y5 = filter(avg5, 1, x);
%% calculating errors
ERx  = RuiCampos_TP4_A3(s,x ); ERx  = string(ERx );
ERy3 = RuiCampos_TP4_A3(s,y3); ERy3 = string(ERy3);
ERy5 = RuiCampos_TP4_A3(s,y5); ERy5 = string(ERy5);
%% plotting
figure,hold on
plot(n, s),plot(n, y3, '--'),plot(n, y5, '-.')

legend({'s[n]',...
        "y3[n]: ER = " + ERy3,       ...
        "y5[n]: ER = " + ERy5},      ...
        'Location', 'best')

xlabel('n'), ylabel('Signal Amplitude')
titulo = "ER de aprox de x[n] a s[n] = "  + ERx;
title(titulo)

