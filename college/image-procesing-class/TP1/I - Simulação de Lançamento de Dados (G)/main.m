clear variables
%DATA = ["Média de D1+D2", "Quantos entre 2 e 12?", "Percentagem de Doubles","Num de 6 6", "Max Lanç"]

N = 800;
DATA = zeros(N, 4);
for i=1:N
    [media, ~, percentagem, pares, maior_numero] = get_meDATA(i, 0);
    DATA(i, :) = [media, percentagem, pares, maior_numero];
end
[media, sampleD, percentagem, pares, maior_numero] = get_meDATA(10000, 1);

%["Média de D1+D2", "Quantos entre 2 e 12?", "Percentagem de Doubles","Num de 6 6", "Max Lanç"; DATA];

close all
x=1:1:N;

%%FIGURE 1
figure('Name', 'Amostras de D1+D2', 'NumberTitle', 'off')
subplot(2,1,1)
plot(x,DATA(:,1))
xlabel('Número de Lançamentos')
ylabel('Média dos Lançamentos')
title('Médias')

y = 2:13;
z = 0.5*ones(1,12);

subplot(2,1,2)
%figure('Name', 'Número de resultados entre 2 e 12')
histogram('BinEdges', y-z, 'BinCounts', sampleD)
xlabel('D1+D2')
ylabel('Número de Lançamentos')
title('Distribuição')


%%FIGURE 2
figure('Name', 'Amostras de (D1, D2)', 'NumberTitle', 'off')
subplot(3,1,1)
plot(x, DATA(:,2))
xlabel('Número de Lançamentos')
ylabel('Perc. de Doubles(%)')
title('Doubles')

%figure('Name', 'Doubles: 6 6')
subplot(3,1,2)
plot(x, DATA(:,3))
xlabel('Número de Lançamentos')
ylabel('# de Lançamentos (6 6)')
title('Doubles (6,6)')

subplot(3,1,3)
plot(x, DATA(:,4))
xlabel('Número de Lançamentos')
ylabel('# max. de lançamentos sem (6 6)')
title('Lançamentos sem (6,6)')



