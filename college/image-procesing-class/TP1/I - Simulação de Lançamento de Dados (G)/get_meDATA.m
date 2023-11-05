function [media, sampleD, percentagem, pares, maior_numero] = get_meDATA(N, hist)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%Cálculo do valor médio para o lançamento de pares
sample = zeros(N, 2);

for i=1:N
    [d1, d2]    = par();
    sample(i,:) = [d1, d2];
end

D1 = sample(:,1);
D2 = sample(:,2);

somaD = D1 + D2;
media = mean(somaD);

%Numero de vezes que ocorre cada valor (2 a 12)
sampleD = 0;
if hist == 1
    sampleD = zeros(1,11);
    for i=2:12
        bool1 = somaD == i;
        sampleD(1,i-1)=sum(bool1);
    end
end
    


%A percentagem de ’doubles’ (valor dos dois dados igual)

bool2       = D1 == D2;
doubles     = sum(bool2);
percentagem = doubles/N*100;

%Numero de vezes que sai um par de 6 duas vezes seguidas.

bool3 = D1 == D2 & D1 == 6;
pares = sum(bool3);

%Maior numero de lan ?camentos sem se obter 12 (2x6).

counter     = 0;
lancamentos = zeros(N, 1);
for i=1:N
    counter = counter + 1;
    if bool3(i)==1
        lancamentos(i,1) = [counter];
        counter = 0;
    end
    if i == N
        lancamentos(i,1) = [counter];
    end
end
maior_numero = max(lancamentos);
end

