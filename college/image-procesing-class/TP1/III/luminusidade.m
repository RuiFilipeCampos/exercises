function [IMG_out] = luminusidade(IMG_in, b)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
IMG_in = double(IMG_in);
N = size(IMG_in);
add = b*ones(N);
IMG_out = uint8(IMG_in + add);
end

