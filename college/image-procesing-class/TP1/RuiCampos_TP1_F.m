name = 'US.jpg';
%S&P NOISE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
levels = 0:0.1:1;
N = size(levels);
N = N(1,2);
ERROS = zeros(N,5);

i = 1;
for r = levels
    [e1,e2,e3,e4,e5] = RuiCampos_TP1_F1(name,r,0);
    ERROS(i, :) = [e1,e2,e3,e4, e5];
    i = i+1;
end

figure('Name', 'Salt and Pepper')

hold on
for i=1:5
    plot(levels, ERROS(:, i), '-o', 'MarkerSize', 2)
end

legend('+Noise', '+noise + 3x3 avg filter', '+noise + 5x5 avg filter', '+noise + 3x3 mdn filter','+noise + 5x5 mdn filter', 'Location', 'Northwest' )
title("Performance of Filters on " + string(name)  + '(S&P Noise)')
xlabel('Level of Contamination')
ylabel('Mean Absolute Error')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GAUSSIAN NOISE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Gaussian Noise')
subplot(1,2,1)
%VARYING MEAN, variance=80 %%%%%%%%%%%%%%%%%%%%
levels = -2:0.1:2;

N = size(levels);
N = N(1,2);
ERROS = zeros(N,5);

i = 1;
for r = levels
    [e1,e2,e3,e4,e5] = RuiCampos_TP1_F1(name,r,1, 0.05);
    ERROS(i, :) = [e1,e2,e3,e4, e5];
    i = i+1;
end

hold on
for i=1:5
    plot(levels, ERROS(:, i), '-o', 'MarkerSize', 2)
end

title("Varying Mean(variance=0.05)")
xlabel('Mean')
ylabel('Mean Absolute Error')

%VARYING VARIANCE, MEAN=0%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,2)

levels = 0:0.3:5;
N = size(levels);
N = N(1,2);
ERROS = zeros(N,5);


i = 1;
for r = levels
    [e1,e2,e3,e4,e5] = RuiCampos_TP1_F1(name, 0,1, r);
    ERROS(i, :) = [e1,e2,e3,e4, e5];
    i = i+1;
end

hold on
for i=1:5
    plot(levels, ERROS(:, i), '-o', 'MarkerSize', 2)
end

title("Varying Variance (mean=0)")
xlabel('Variance')
ylabel('Mean Absolute Error')
legend('+Noise', '+noise +3x3 avg', '+noise +5x5 avg', '+noise +3x3 mdn','+noise +5x5 mdn', 'Location', 'best')


