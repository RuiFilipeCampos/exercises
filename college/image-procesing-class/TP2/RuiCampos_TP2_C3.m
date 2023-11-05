GT = imread('seg1.jpg'); GT = im2bw(GT, 0.5);


%GRADIENT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Gradient')

subplot(1,3,1) %VARYING S
N = 20; S = transpose(1:N);
DATA = [S, ones(N,6)];
for i=1:N
    AS = RuiCampos_TP2_C2('seg2.jpg', i, 0);
    [TDR,TNR,FNR,FPR,J,H] = RuiCampos_TP2_C3a(GT, AS);
    DATA(i, 2) = TDR; DATA(i, 3) = TNR;
    DATA(i, 4) = FNR; DATA(i, 5) = FPR;
    DATA(i, 6) = J; DATA(i, 7) = H;
end

hold on
plot(S, DATA(:, 2)), plot(S, DATA(:, 3))
plot(S, DATA(:, 4)), plot(S, DATA(:, 5))
plot(S, DATA(:, 6)), plot(S, DATA(:, 7))

xlabel('S'), ylabel('Result of Measure')
title('Error Measures for Gradient')

legend('TDR', 'TNR', 'FNR', 'FPR','J', 'H', 'Location' , 'Best')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,3,2) %varying luminosity, S = 10
seg2 = imread('seg2.jpg');


L=200; LUM = transpose(-L:50:L); N = size(LUM, 1);
DATA = [LUM, ones(N,6)];
for i=1:N
    dL = LUM(i,1);
    img = uint8(dL+seg2);
    name = string(i) + ".jpg"; name = char(name);
    imwrite(img, name); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%WRITE
    
    
    AS = RuiCampos_TP2_C2(name, 10, 0);
    [TDR,TNR,FNR,FPR,J,H] = RuiCampos_TP2_C3a(GT, AS);
   
    DATA(i, 2) = TDR; DATA(i, 3) = TNR;
    DATA(i, 4) = FNR; DATA(i, 5) = FPR;
    DATA(i, 6) = J;   DATA(i, 7) = H;
    %delete(name) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DELETE
end

hold on
plot(LUM, DATA(:, 2)), plot(LUM, DATA(:, 3))
plot(LUM, DATA(:, 4)), plot(LUM, DATA(:, 5))
plot(LUM, DATA(:, 6)), plot(LUM, DATA(:, 7))

xlabel('Luminosity'), ylabel('Result of Measure')
title('Error Measures(S=10)')

legend('TDR', 'TNR', 'FNR', 'FPR','J', 'H', 'Position', 'Best')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,3,3) %varying contrast, S = 10

CONT = transpose(0:0.4:2); N = size(CONT, 1);
DATA = [CONT, ones(N,6)];
for i=1:N
    
    dC = CONT(i,1);
    img = uint8(dC*seg2);

    name = string(i) + ".jpg"; name = char(name);
    imwrite(img, name); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%WRITE
    
    
    %APPLYING THRESHOLD TO NEW GT
    AS = RuiCampos_TP2_C2(name, 10, 0);
    [TDR,TNR,FNR,FPR,J,H] = RuiCampos_TP2_C3a(GT, AS);
    DATA(i, 2) = TDR; DATA(i, 3) = TNR;
    DATA(i, 4) = FNR; DATA(i, 5) = FPR;
    DATA(i, 6) = J;   DATA(i, 7) = H;
    
    %delete(name) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DELETE
end

hold on
plot(CONT, DATA(:, 2)), plot(CONT, DATA(:, 3))
plot(CONT, DATA(:, 4)), plot(CONT, DATA(:, 5))
plot(CONT, DATA(:, 6)), plot(CONT, DATA(:, 7))

xlabel('Contrast'), ylabel('Result of Measure')
title('Error Measures(S=10)')

legend('TDR', 'TNR', 'FNR', 'FPR','J', 'H', 'Position', 'Best')











%NOISE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Gradient + Noise')

subplot(1,3,1) %VARYING S
N = 20; S = transpose(1:N);
DATA = [S, ones(N,6)];
for i=1:N
    AS = RuiCampos_TP2_C2('seg3.jpg', i, 0);
    [TDR,TNR,FNR,FPR,J,H] = RuiCampos_TP2_C3a(GT, AS);
    DATA(i, 2) = TDR; DATA(i, 3) = TNR;
    DATA(i, 4) = FNR; DATA(i, 5) = FPR;
    DATA(i, 6) = J; DATA(i, 7) = H;
end

hold on
plot(S, DATA(:, 2)), plot(S, DATA(:, 3))
plot(S, DATA(:, 4)), plot(S, DATA(:, 5))
plot(S, DATA(:, 6)), plot(S, DATA(:, 7))

xlabel('S'), ylabel('Result of Measure')
title('Error Measures for Gradient')

legend('TDR', 'TNR', 'FNR', 'FPR','J', 'H')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,3,2) %varying luminosity, S = 10
seg2 = imread('seg3.jpg');


L=200; LUM = transpose(-L:50:L); N = size(LUM, 1);
DATA = [LUM, ones(N,6)];
for i=1:N
    dL = LUM(i,1);
    img = uint8(dL+seg2);
    name = string(i) + ".jpg"; name = char(name);
    imwrite(img, name);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%WRITE
    
    
    AS = RuiCampos_TP2_C2(name, 10, 0);
    [TDR,TNR,FNR,FPR,J,H] = RuiCampos_TP2_C3a(GT, AS);
   
    DATA(i, 2) = TDR; DATA(i, 3) = TNR;
    DATA(i, 4) = FNR; DATA(i, 5) = FPR;
    DATA(i, 6) = J;   DATA(i, 7) = H;
    %delete(name)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DELETE
end

hold on
plot(LUM, DATA(:, 2)), plot(LUM, DATA(:, 3))
plot(LUM, DATA(:, 4)), plot(LUM, DATA(:, 5))
plot(LUM, DATA(:, 6)), plot(LUM, DATA(:, 7))

xlabel('Luminosity'), ylabel('Result of Measure')
title('Error Measures(S=10)')

legend('TDR', 'TNR', 'FNR', 'FPR','J', 'H', 'Position', 'Best')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,3,3) %varying contrast, S = 10



CONT = transpose(0:0.5:2); N = size(CONT, 1);
DATA = [CONT, ones(N,6)];
for i=1:N
    
    dC = CONT(i,1);
    img = uint8(dC*seg2);

    name = string(i) + ".jpg"; name = char(name);
    imwrite(img, name);
    
    
   
    AS = RuiCampos_TP2_C2(name, 10, 0);
    [TDR,TNR,FNR,FPR,J,H] = RuiCampos_TP2_C3a(GT, AS);
    DATA(i, 2) = TDR; DATA(i, 3) = TNR;
    DATA(i, 4) = FNR; DATA(i, 5) = FPR;
    DATA(i, 6) = J;   DATA(i, 7) = H;
    
    %delete(name)
end

hold on
plot(CONT, DATA(:, 2)), plot(CONT, DATA(:, 3))
plot(CONT, DATA(:, 4)), plot(CONT, DATA(:, 5))
plot(CONT, DATA(:, 6)), plot(CONT, DATA(:, 7))

xlabel('Contrast'), ylabel('Result of Measure')
title('Error Measures(S=10)')

legend('TDR', 'TNR', 'FNR', 'FPR','J', 'H', 'Position', 'Best')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
