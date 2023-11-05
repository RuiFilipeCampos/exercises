function [] = RuiCampos_TP2_A2(name)
%%%%VERIFICAR QUE AS CORES ESTÃO CORRETAS


IMG = imread(name);
N = size(IMG, 1); M = size(IMG, 2);

R = IMG(:,:,1);
G = IMG(:,:,2);
B = IMG(:,:,3);

figure('Name', 'Deteção de Contornos')

subplot(2,2,1), imshow(IMG), title('Original')
subplot(2,2,2)

h1 = [1 1 1; 0 0 0; -1 -1 -1];  h2 = -1*h1;                   

rH1 = imfilter(R, h1); gH1 = imfilter(G, h1); bH1 = imfilter(B, h1);
rH2 = imfilter(R, h2); gH2 = imfilter(G, h2); bH2 = imfilter(B, h2);

rH = rH1 + rH2; gH = gH1 + gH2; bH = bH1 + bH2; 

CH = rH;
CH(:,:, 2) = gH;
CH(:,:, 3) = bH;

imshow(CH), title('Contornos Horizontais')

subplot(2,2,3)

v1 = transpose(h1); v2 = transpose(h2);                   

rV1 = imfilter(R, v1); gV1 = imfilter(G, v1); bV1 = imfilter(B, v1);
rV2 = imfilter(R, v2); gV2 = imfilter(G, v2); bV2 = imfilter(B, v2);

rV = rV1 + rV2; gV = gV1 + gV2; bV = bV1 + bV2; 

CV = rV;
CV(:,:, 2) = gV;
CV(:,:, 3) = bV;

imshow(CV), title('Contornos Verticais')

subplot(2,2,4), imshow(CV + CH), title('Todos os Contornos')

dim = size(R); N = dim(1,1)/2; M = dim(1,2)/2;
N = uint8(N); M=uint8(M);

tit_fig = "Cortes H e V (x=" + string(N) + " e y=" + string(M) + ")";
tit_fig = char(tit_fig);

figure('Name', tit_fig)

subplot(2, 3, 1)
hold on

plot(R(N, :), 'color', 'red'),plot(G(N, :), 'color', 'green'),plot(B(N, :), 'color', 'blue')
xlabel('Localização do Píxel(eixo-x)')
ylabel('Intensidade do Píxel')
legend('Red', 'Green','Blue', 'Location', 'Best')
title('Perfil Horizontal(IO)')

subplot(2, 3, 2)
hold on
plot(rH(N, :), 'color', 'red'),plot(gH(N, :), 'color', 'green'),plot(bH(N, :), 'color', 'blue')
xlabel('Localização do Píxel(eixo-x)')
ylabel('Intensidade do Píxel')
title('Perfil Horizontal(CH)')


subplot(2, 3, 3)
hold on
plot(rV(N, :), 'color', 'red'),plot(gV(N, :), 'color', 'green'),plot(bV(N, :), 'color', 'blue')
xlabel('Localização do Píxel(eixo-x)')
ylabel('Intensidade do Píxel')
title('Perfil Horizontal(CV)')

subplot(2, 3, 4)
hold on
plot(R(:, M), 'color', 'red'),plot(G(:, M), 'color', 'green'),plot(B(:, M), 'color', 'blue')
xlabel('Localização do Píxel(eixo-y)')
ylabel('Intensidade do Píxel')
title('Perfil Vertical(IO)')


subplot(2, 3, 5)

hold on
plot(rH(:, M), 'color', 'red'),plot(gH(:, M), 'color', 'green'),plot(bH(:, M), 'color', 'blue')
xlabel('Localização do Píxel(eixo-y)')
ylabel('Intensidade do Píxel')
title('Perfil Vertical(CH)')


subplot(2, 3, 6)
hold on
plot(rV(:, M), 'color', 'red'),plot(gV(:, M), 'color', 'green'),plot(bV(:, M), 'color', 'blue')
xlabel('Localização do Píxel(eixo-y)')
ylabel('Intensidade do Píxel')
title('Perfil Vertical(CV)')

end

