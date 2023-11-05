I = imread('Urso.jpg');
I = rgb2gray(I);
for i=1:100
    I = imnoise(I, 'gaussian', 0, .0001);
end

figure
subplot(1,2,2)
imshow(I)

subplot(1,2,1)
imhist(I)
