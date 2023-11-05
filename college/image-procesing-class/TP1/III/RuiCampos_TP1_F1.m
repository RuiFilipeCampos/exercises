function [e1,e2,e3,e4, e5] = RuiCampos_TP1_F1(name,noise, noise_type, variance)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here



%CREATING FILTERS
avgF3 = [1 1 1; 1 1 1; 1 1 1]/9;
avgF5 = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1]/25;

%READ and APPLY FILTERS
IMG = imread(name);

if noise_type == 1
    IMGn1 = imnoise(IMG, 'gaussian', noise, variance);
else
    IMGn1 = imnoise(IMG, 'salt & pepper', noise);
end

IMGF3 = imfilter(IMGn1, avgF3);
IMGF5 = imfilter(IMGn1, avgF5);

IMGmdn3 = ordfilt2(IMGn1, (3*3+1)/2 ,true(3));
IMGmdn5 = ordfilt2(IMGn1, (5*5+1)/2 ,true(5));


%DATA ANALYSIS
[M,N]=size(IMG);

IMG = double(IMG);
IMGn1 = double(IMGn1);

IMGF3 = double(IMGF3);
IMGF5 = double(IMGF5);

IMGmdn3 = double(IMGmdn3);
IMGmdn5 = double(IMGmdn5);


ABS = (IMG-IMGn1).^2;
ABS = sqrt(reshape(ABS, [1,M*N]));
e1  = mean(ABS);

ABS = (IMG-IMGF3).^2;
ABS = sqrt(reshape(ABS, [1,M*N]));
e2  = mean(ABS);

ABS = (IMG-IMGF5).^2;
ABS = sqrt(reshape(ABS, [1,M*N]));
e3  = mean(ABS);

ABS = (IMG-IMGmdn3).^2;
ABS = sqrt(reshape(ABS, [1,M*N]));
e4  = mean(ABS);

ABS = (IMG-IMGmdn5).^2;
ABS = sqrt(reshape(ABS, [1,M*N]));
e5  = mean(ABS);
end


