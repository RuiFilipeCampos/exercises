function [IMG_out] = RuiCampos_TP1_D(name1,name2)
%READ DATA
IMG      = imread(name1);
IMG_ref  = imread(name2);

%1. obter histograma
[COUNTS, X] = imhist(IMG_ref);

%2. equalizar
IMG_out = histeq(IMG, COUNTS/max(COUNTS));

figure
subplot(2,3,1)
imshow(IMG)
title("Original")

subplot(2,3,2)
imshow(IMG_ref)
title("Referência")

subplot(2,3,3)
imshow(IMG_out)
title("Equalizada c/ ref")

subplot(2,3,4)
imhist(IMG)

subplot(2,3,5)
imhist(IMG_ref)

subplot(2,3,6)
imhist(IMG_out)

%figure
%stem(COUNTS/max(COUNTS))
end

