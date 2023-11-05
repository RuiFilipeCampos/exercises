function [] = RuiCampos_TP2_C1(name) 

imgO = imread(name);

[x, y, Nb] = size(imgO);

if Nb == 3 
    imgGS = rgb2gray(imgO); 
else
    imgGS = imgO;
end

T = graythresh(imgGS);
BW = im2bw(imgGS, T);
titulo = "Segmentada(T=" + string(T) + "; " + string(T*255) + ")";

titulo = char(titulo);

figure('Name', name)
subplot(2,2,1), imshow(imgO), title('Imagem Original')
subplot(2,2,2), imshow(imgGS), title('Imagem Grayscale')
subplot(2,2,3), imshow(BW), title(titulo)
subplot(2,2,4), imhist(imgGS),ylabel('Pixel Count'), title('Histograma da imagem em grayscale')
end


