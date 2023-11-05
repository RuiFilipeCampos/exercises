clear variables
%DATA = ["M�dia de D1+D2", "Quantos entre 2 e 12?", "Percentagem de Doubles","Num de 6 6", "Max Lan�"]

N = 800;
DATA = zeros(N, 4);
for i=1:N
    [media, ~, percentagem, pares, maior_numero] = get_meDATA(i, 0);
    DATA(i, :) = [media, percentagem, pares, maior_numero];
end
[media, sampleD, percentagem, pares, maior_numero] = get_meDATA(10000, 1);

%["M�dia de D1+D2", "Quantos entre 2 e 12?", "Percentagem de Doubles","Num de 6 6", "Max Lan�"; DATA];

close all
x=1:1:N;

%%FIGURE 1
figure('Name', 'Amostras de D1+D2', 'NumberTitle', 'off')
subplot(2,1,1)
plot(x,DATA(:,1))
xlabel('N�mero de Lan�amentos')
ylabel('M�dia dos Lan�amentos')
title('M�dias')

y = 2:13;
z = 0.5*ones(1,12);

subplot(2,1,2)
%figure('Name', 'N�mero de resultados entre 2 e 12')
histogram('BinEdges', y-z, 'BinCounts', sampleD)
xlabel('D1+D2')
ylabel('N�mero de Lan�amentos')
title('Distribui��o')


%%FIGURE 2
figure('Name', 'Amostras de (D1, D2)', 'NumberTitle', 'off')
subplot(3,1,1)
plot(x, DATA(:,2))
xlabel('N�mero de Lan�amentos')
ylabel('Perc. de Doubles(%)')
title('Doubles')

%figure('Name', 'Doubles: 6 6')
subplot(3,1,2)
plot(x, DATA(:,3))
xlabel('N�mero de Lan�amentos')
ylabel('# de Lan�amentos (6 6)')
title('Doubles (6,6)')

subplot(3,1,3)
plot(x, DATA(:,4))
xlabel('N�mero de Lan�amentos')
ylabel('# max. de lan�amentos sem (6 6)')
title('Lan�amentos sem (6,6)')



