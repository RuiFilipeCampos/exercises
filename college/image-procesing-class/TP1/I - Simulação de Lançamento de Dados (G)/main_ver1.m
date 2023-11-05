%primeiro vou testar o dado!
N = 9500;
sample = [];
for i=1:N
    d = dado();
    sample = [sample, d];
end

avg_comp = mean(sample);

dist = ones(1, 6)/6;
var = 1:6;
avg_teor = sum(dist.*var);

avg_teor, avg_comp

"parece funcionar!"

%Cálculo do valor médio para o lançamento de pares

N = 15;
sample = [];

for i=1:N
    [d1, d2] = par();
    sample = [sample; d1 d2];
end

D1 = sample(:,1)
D2 = sample(:,2)

somaD = D1 + D2
media = mean(somaD);

%Numero de vezes que ocorre cada valor (2 a 12)
bool1 = somaD<12 & somaD>2;
numero_de_vezes = sum(bool1);

%A percentagem de ’doubles’ (valor dos dois dados igual)

bool2 = D1 == D2;
doubles = sum(bool2);
percentagem = doubles/N*100;

%N ?umero de vezes que sai um par de 6 duas vezes seguidas.

bool3 = D1 == D2 & D1 == 6;
sum(bool3)

%Maior n ?umero de lan ?camentos sem se obter 12 (2x6).

counter = 0;
lancamentos = [];
for i=1:N
    counter = counter + 1;
    if bool3(i)==1
        lancamentos = [lancamentos, counter];
        counter = 0
    end
    if i == N
        lancamentos = [lancamentos, counter]
    end
   
end
maior_numero = max(lancamentos)

