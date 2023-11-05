function [] = RuiCampos_TP2_B4(name)
name = char(name);
RGB = imread(name);

if size(RGB, 3) ~= 3
error("Input must be RGB image.")
end

[X,Y,Z] = size(RGB);

%defining middle
mX = X/2; mY = Y/2;
dX  = ceil(.05*X); dY  = ceil(.05*Y);

subRGB = RGB( mX-dX:mX+dX , mY-dY:mY+dY , : );
R = subRGB(:,:,1); G = subRGB(:,:,2); B = subRGB(:,:,3);

HSV = rgb2hsv(subRGB);
H = HSV(:,:,1); S = HSV(:,:,2); V = HSV(:,:,3);


figure('Name', name)
subplot(2,4,1), imshow(RGB), title('original + subregião')

subplot(2,4,2)
text = "Red" + newline + RuiCampos_TP2_B4a(R);
imshow(R), title(char(text))

subplot(2,4,3)
text = "Green" + newline + RuiCampos_TP2_B4a(G);
imshow(G), title(char(text))

subplot(2,4,4)
text = "Blue" + newline + RuiCampos_TP2_B4a(B);
imshow(B), title(char(text))

subplot(2,4,5)
imshow(subRGB), title('subregião')

subplot(2,4,6)
text = "Hue" + newline + RuiCampos_TP2_B4a(H);
imshow(H), title(char(text))

subplot(2,4,7)
text = "Saturation" + newline + RuiCampos_TP2_B4a(S);
imshow(S), title(char(text))

subplot(2,4,8)
text = "Value" + newline + RuiCampos_TP2_B4a(V);
imshow(V), title(char(text))
end

