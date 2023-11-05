function [] = RuiCampos_TP1_E(name,noise)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

IMG =imread(name);

IMGn1 = imnoise(IMG, 'salt & pepper', noise);

avgF3 = [1 1 1; 1 1 1; 1 1 1]/9;
avgF5 = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1]/25;

IMGF3 = imfilter(IMGn1, avgF3);
IMGF5 = imfilter(IMGn1, avgF5);

IMGmdn3 = ordfilt2(IMGn1, (3*3+1)/2 ,true(3));
IMGmdn5 = ordfilt2(IMGn1, (5*5+1)/2 ,true(5));


[M,N]=size(IMG);

figure('Name', 'Filters')

subplot(2,3,1)
imshow(IMG)
title('Original')

IMG = double(IMG);

subplot(2,3,2)
IMGn1 = double(IMGn1);
ABS = (IMG-IMGn1).^2;
ABS = sqrt(double(reshape(ABS, [1,M*N])));
e1 = mean(ABS);
imshow(uint8(IMGn1))
title('Noise - ' + string(e1))

subplot(2,3,3)
IMGF3 = double(IMGF3);
ABS = (IMG-IMGF3).^2;
ABS = sqrt(double(reshape(ABS, [1,M*N])));
e2 = mean(ABS);
imshow(uint8(IMGF3))
title('Média 3x3- ' + string(e2))

subplot(2,3,4)
IMGF5 = double(IMGF5);
ABS = (IMG-IMGF5).^2;
ABS = sqrt(double(reshape(ABS, [1,M*N])));
e3 = mean(ABS);
imshow(uint8(IMGF5))
title('Média 5x5- ' + string(e3))

subplot(2,3,5)
IMGmdn3 = double(IMGmdn3);
ABS = (IMG-IMGmdn3).^2;
ABS = sqrt(double(reshape(ABS, [1,M*N])));
e4 = mean(ABS);
imshow(uint8(IMGmdn3))
title('Mediana 3x3- ' + string(e4))

subplot(2,3,6)
IMGmdn5 = double(IMGmdn5);
ABS = (IMG-IMGmdn5).^2;
ABS = sqrt(double(reshape(ABS, [1,M*N])));
avg = mean(ABS);
imshow(uint8(IMGmdn5))
title('Mediana 5x5 - '  + string(avg))
end

