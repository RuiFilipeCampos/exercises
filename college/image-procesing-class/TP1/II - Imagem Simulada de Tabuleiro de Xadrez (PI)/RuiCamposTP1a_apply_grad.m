function [img_out] = apply_grad(img, Imin, Imax)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

N = length(img);
gradiente = ones(N);

dI = (Imax-Imin)/(N-1); %!!!!

linha = Imin:dI:Imax;
size(linha);
for x=1:N
    gradiente(x,:) = linha.*gradiente(x,:);
end

%img = new_chess();
img = double(img);
img = img.*gradiente;

img_out = uint8(img);
imshow(img_out)
end

