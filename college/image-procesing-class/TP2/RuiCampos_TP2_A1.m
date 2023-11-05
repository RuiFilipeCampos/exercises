function [] = RuiCampos_TP2_A1(name)
IMG = imread(name);

if size(IMG, 3) ~= 1
    IMG = rgb2gray(IMG);
end



figure('Name', 'Dete��o de Contornos')

subplot(2,2,1), imshow(IMG), title('Original') 
subplot(2,2,2)

h1 = [1 1 1; 0 0 0; -1 -1 -1]; H1 = imfilter(IMG, h1);
h2 = -1*h1;                    H2 = imfilter(IMG, h2);

H = H1 + H2; imshow(H), title('Contornos Horizontais')

subplot(2,2,3)

v1 = transpose(h1); V1 = imfilter(IMG, v1);     
v2 = transpose(h2); V2 = imfilter(IMG, v2);

V = V1 + V2; imshow(V), title('Contornos Verticais')

subplot(2,2,4), imshow(V + H), title('Todos os Contornos')



%Figure Cuts%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x, y] = size(IMG);

X = 1:x;Y=1:y;

N = uint8(x/2); M=uint8(y/2);

tit_fig = "Cortes H e V (x=" + string(N) + " e y=" + string(M) + ")";
tit_fig = char(tit_fig);

figure('Name', tit_fig)

subplot(2, 3, 1), plot(X, IMG(N, :))
xlabel('Localiza��o do P�xel(eixo-x)')
ylabel('Intensidade do P�xel')
title('Perfil Horizontal(IO)')


subplot(2, 3, 2), plot(X, H(N, :))
xlabel('Localiza��o do P�xel(eixo-x)')
ylabel('Intensidade do P�xel')
title('Perfil Horizontal(CH)')

subplot(2, 3, 3), plot(X, V(N, :))
xlabel('Localiza��o do P�xel(eixo-x)')
ylabel('Intensidade do P�xel')
title('Perfil Horizontal(CV)')

subplot(2, 3, 4), plot(Y, IMG(:, M))
xlabel('Localiza��o do P�xel(eixo-y)')
ylabel('Intensidade do P�xel')
title('Perfil Vertical(IO)')

subplot(2, 3, 5), plot(Y, H(:, M))
xlabel('Localiza��o do P�xel(eixo-y)')
ylabel('Intensidade do P�xel')
title('Perfil Vertical(CH)')

subplot(2, 3, 6), plot(Y, V(:, M))
xlabel('Localiza��o do P�xel(eixo-y)')
ylabel('Intensidade do P�xel')
title('Perfil Vertical(CV)')

end

