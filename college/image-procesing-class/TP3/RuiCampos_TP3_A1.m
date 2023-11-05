function [IB] = RuiCampos_TP3_A1(name, graf)
%% Reading Iamge - Checking for RGB
Io = imread(name); [Nx, Ny, Nz] = size(Io);
if Nz == 3
    I = rgb2gray(Io);
elseif Nz == 1
    I = Io;
else
    error('Matrix dimensinon neither 1 or 3: Could not interpret this as grayscale or RGB!')
end 
%% GLOBAL THRESH
T = graythresh(I); IBo = im2bw(I, T); IBc = ~IBo;
%% CHOOSING CENTER SEGMENT
%PLAN: 1. calculate distance r of each ON pixel to the middle of the image
%      2. calculate the average of those distances
%      3. the segment with the smaller average is chosen

center_x = uint8(Nx/2); rIBo = zeros(Nx, Ny);
center_y = uint8(Ny/2); rIBc = zeros(Nx, Ny);
 
%need these in double to use sqrt()
center_x = double(center_x); Nx = double(Nx);
center_y = double(center_y); Ny = double(Ny);

for x=1:Nx
    for y=1:Ny
        r = sqrt((x-center_x)^2 + (y-center_y)^2);
        if IBo(x,y) == 1
            rIBo(x,y) = r; 
        else
            rIBc(x,y) = r; 
        end
    end
end

AVGo = sum(sum(rIBo))/sum(sum(IBo));
AVGc = sum(sum(rIBc))/sum(sum(IBc));

if AVGo < AVGc
    IB = IBo;
else
    IB = IBc;
end
%% Graphing
if graf==1
    figure
    subplot(2,2,1), imshow(Io), title('Imagem Original')
    subplot(2,2,2), imshow(I), title('Versão Grayscale')
    subplot(2,2,3), imshow(IBo), title('Threshold Global')
    subplot(2,2,4), imshow(IB), title('Binária Central')
end
end

