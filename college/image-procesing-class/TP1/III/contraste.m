function [IMG_out] = contraste(IMG_in, x)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
IMG_in = double(IMG_in);
IMG_out = uint8(x*IMG_in);
end

