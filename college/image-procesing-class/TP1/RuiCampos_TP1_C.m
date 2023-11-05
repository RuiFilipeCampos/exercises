function [] = RuiCampos_TP1_C(name,gamma)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

%READING DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%
IMG  = imread(name);
IMGd = double(IMG);
[N,M]=size(IMGd);


figure('Name','TP1')
%%%ORIGINAL%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,4,1)
imshow(IMG);
title("Original")


%%%OPTIMIZADA%%%%%%%%%%%%%%%%%%%%%%%%
IMGd_line = reshape(IMGd, [1, N*M]);
%r_max = max(IMGd_line);
%r_min = min(IMGd_line);

r_min = prctile(IMGd_line, 1);
r_max = prctile(IMGd_line, 99);

alpha = 255/(r_max-r_min);
beta = -alpha*r_min;
IMG_opt = uint8( alpha*IMGd+beta );

subplot(2,4,2)
imshow(IMG_opt);
title("Optimizada")

%%%GAMMA%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,4,3)
IMG_gamma = imadjust(IMG,[],[],gamma);
imshow(IMG_gamma)
title("gamma=" + string(gamma))


%%%EQUALIZADA%%%%%%%%%%%%%%%%%%%%%%%%
IMG_eq = histeq(IMG);
subplot(2,4,4)
imshow(IMG_eq);
title("Equalizada")

%HISTOGRAMAS%%%%%%%%%%%%%%%%%%%%%%%%%
%%%hist:ORIGINAL%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,4,5)
title("Histograma da Original")
imhist(IMG)

%%%hist:OPTIMIZADA%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,4,6)
title("Histograma da Optimização")
imhist(IMG_opt);

%%%hist:GAMMA%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,4,7)
title("Histograma da TG")
imhist(IMG_gamma)

%%%hist:EQUALIZADO%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,4,8)
title("Histograma Equalizado")
imhist(IMG_eq)
end

