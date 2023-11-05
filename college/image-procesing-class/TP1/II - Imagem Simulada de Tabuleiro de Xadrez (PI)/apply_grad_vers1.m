function [img_out] = apply_grad(img, Imin, Imax)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

N = length(img);
gradiente = ones(N);

for x=1:N
    for y=1:N
        z = grad(x,y,theta, N, Imin, Imax);
        gradiente(x,y) = z;
    end
end



%img = new_chess();
img = double(img);
img = img.*gradiente;

img_out = uint8(img);
imshow(img_out)
end

