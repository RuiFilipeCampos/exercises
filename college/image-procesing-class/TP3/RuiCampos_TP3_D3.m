function [] = RuiCampos_TP3_D3(name, frames)
%name:     filename (ex:'pic.jpg')
%frames: the ammount of frames each video will have
%        at the exception of the last video, it creates 2*frames 
%% Checking Optional Input
%Not passing any arguments will replicate the conditions I used to write
%the report.
if ~exist('name', 'var')
    name = 'Urso.jpg';
end
if ~exist('frames', 'var')
    frames = 5;
end
%% Reading Image - Checking for RGB
im = imread(name);

if size(im, 3) == 3
    im = rgb2gray(im);
end

imO = im;

f = figure('visible','off','units', 'normalized', 'outerposition', [0 0 1 1]);
%% FFT
%% Creating Video Object and Hidden Figure
videoObj = VideoWriter('RuiCampos_AvgFilterFFT.avi'); videoObj.FrameRate = 3; open(videoObj);

%% Creating Video - FIRST FRAME
subplot(1,3,1), imshow(im),title('Image');
imFFT = fft2(im);
imFFT = abs(fftshift(imFFT));

subplot(1,3,2), imshow(log(imFFT), jet(10)), title('FFT of Image')
subplot(1,3,3), imhist(im), title('Histogram of Image');

FRAME = getframe(f);

writeVideo(videoObj, FRAME);
%% Creating Video - REMAINDING FRAMES
h = [1 1 1;1 1 1; 1 1 1]/9;
disp('Rendering RuiCampos_AvgFilterFFT.avi...')
for i=1:frames
    %FILTER
    im = imfilter(im, h);
    subplot(1,3,1), imshow(im), title('Image');

    imFFT = fft2(im);
    imFFT = abs(fftshift(imFFT));
    subplot(1,3,2), imshow(log(imFFT),  jet(10)), title('FFT of Image')
    subplot(1,3,3), imhist(im),title('Histogram of Image');

    FRAME = getframe(f);
    writeVideo(videoObj, FRAME);
end
close(videoObj), disp('Done.')
%% Creating Video Object For Salt&Pepper
videoObj1 = VideoWriter('RuiCampos_SP_noise.avi');  videoObj1.FrameRate = 4;
open(videoObj1);
disp('Rendering RuiCampos_SP_noise.avi...')
%% Creating SP Video - Varying contamination level
dR = 1/frames;
R = 0:dR:1;
im = imO;

subplot(1,2,1), 
imShow = imshow(im);
title('Imagem')
subplot(1,2,2), imhist(im), title('Histograma')

writeVideo(videoObj1, getframe(f));

for r = R
    im = imnoise(im, 'salt & pepper' , r);
    subplot(1,2,1), set(imShow, 'CData', im);
    %imshow(im), title('Imagem')
    subplot(1,2,2), imhist(im), title('Histograma')
    
    writeVideo(videoObj1, getframe(f));
end
close(videoObj1), disp('Done.')

%% Creating Video Object For Gaussian Noise
videoObj2 = VideoWriter('RuiCampos_gauss_noise.avi'); videoObj2.FrameRate = 4; open(videoObj2);
disp('Rendering RuiCampos_gauss_noise.avi...')
%% Creating Gaussian Video 
im = imO;

subplot(1,2,1), imshow(im), title('Imagem')
subplot(1,2,2), imhist(im), title('Histograma')

%dSD = .05/frames;
%SDs = 0.5:dSD:0;

subplot(1,2,1); imshow(im), title('Imagem')
subplot(1,2,2); imhist(im), title('Histograma')

for i=1:2*frames
    im = imnoise(im, 'gaussian', 0, .02);
    
    %tit = "Imagem: ruido gauss sd = " + string(sd);
    subplot(1,2,1); imshow(im), title('Image')
    subplot(1,2,2); imhist(im), title('Histograma')
    
    writeVideo(videoObj2, getframe(f));
end
close(videoObj2), disp('Done.')
end

