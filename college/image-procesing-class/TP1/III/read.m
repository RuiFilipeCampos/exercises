function [] = read(name)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%abrir imagem
%fazer histograma
IMG = imread(name);
IMGd = double(IMG);

figure('Name', 'Contrastes', 'NumberTitle', 'off')
subplot(2,3,1);
imshow(IMG);
title("Original");

CONTRASTES = [0.1,0.2,0.5,0.9,1.2,2];

for i=1:6
    subplot(2,3,i);
    x = CONTRASTES(1, i) ;
    IMG_out = int8(x*IMGd);
    imshow(IMG_out);
    title("x" + string(x));
end




LUMINUSIDADES = [-2, -1, -0.1,0.1, 1, 2];
figure('Name', 'Luminusidade', 'NumberTitle', 'off')
subplot(2,3,1);
imshow(IMG);
title("Original");

for i=1:6
    subplot(2,3,i);
    b = LUMINUSIDADES(1, i) ;
    IMG_out = int8(IMGd + 30*b);
    imshow(IMG_out);
    title("+" + string(30*b));
end


GAMMAS = [1, 0.1, 0.5, 0.9, 1.1, 1.5];
figure('Name', 'Gamma Transformation', 'NumberTitle', 'off')
subplot(2,3,1);
imshow(IMG);
title("Original");

for i=2:6
    subplot(2,3,i);
    gamma = GAMMAS(1, i) ;
    IMG_out = imadjust(IMG,[],[],gamma);
    imshow(IMG_out);
    title("gamma=" + string(gamma));
end

end


