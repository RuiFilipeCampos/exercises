function [] = RuiCampos_TP2_B2(name)
Irgb = imread(name);


if size(Irgb, 3) ~= 3
error("Input must be RGB image.")
end

R = Irgb(:,:,1);
G = Irgb(:,:,2);
B = Irgb(:,:,3);


%note: x-labels get superimposed to the gradient in the histogram!
%the gradient serves as the x-label
name = char(name);
figure('Name', name), imshow(Irgb), title('Original')
figure('Name', 'RGB Components')

subplot(2,3,1), imshow(R), title('Red')
subplot(2,3,4), imhist(R), title('Red'), xlabel(''), ylabel('Pixel Count')

subplot(2,3,2), imshow(G), title('Green'),
subplot(2,3,5), imhist(G), title('Green'), xlabel(''), ylabel('Pixel Count')

subplot(2,3,3), imshow(B), title('Blue')
subplot(2,3,6), imhist(B), title('Blue'), xlabel(''), ylabel('Pixel Count')

Ihsv = rgb2hsv(Irgb);

H = Ihsv(:,:,1);
S = Ihsv(:,:,2);
V = Ihsv(:,:,3);


figure('Name', 'HSV Components')
subplot(2,3,1), imshow(H), title('Hue')
subplot(2,3,4), imhist(H), title('Histogram of Hue Component'), xlabel(''), ylabel('Pixel Count')

subplot(2,3,2), imshow(S), title('Saturation'),
subplot(2,3,5), imhist(S), title('Histogram of Saturation Component'), xlabel(''), ylabel('Pixel Count')

subplot(2,3,3), imshow(V), title('Value')
subplot(2,3,6), imhist(V), title('Histogram of Value Component'), xlabel(''), ylabel('Pixel Count')


end

