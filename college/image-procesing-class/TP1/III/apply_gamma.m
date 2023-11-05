function [IMG_out] = apply_gamma(IMG_in,gamma)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
IMG_in = double(IMG_in);
c = (1/255)^(1-gamma);
IMG_out = uint8( c*IMG_in^gamma);
end

