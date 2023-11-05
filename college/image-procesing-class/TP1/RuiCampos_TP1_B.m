%READING DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%
IMG = imread('ROBOT_BW.tif');
IMGd = double(IMG);


%plots:CONTRASTES%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Original + Variação de Contraste', 'NumberTitle', 'off')
%%%ORIGINAL%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,1);
imshow(IMG);
title("Original");

CONTRASTES = [0.1,0.2,0.5,0.9,1.2,2];

for i=2:6
    subplot(2,3,i);
    x = CONTRASTES(1, i) ;
    IMG_out = uint8(x*IMGd);
    imshow(IMG_out);
    title("Original x " + string(x));
end


%plots:LUMINUSIDADE%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Original + Variação de Luminusidade', 'NumberTitle', 'off')
subplot(2,3,1);
imshow(IMG);
title("Original");

LUMINUSIDADES = 30*[-2, -1, -0.1,0.1, 1, 2];

for i=2:6
    subplot(2,3,i);
    b = LUMINUSIDADES(1, i) ;
    IMG_out = uint8(IMGd + b);
    imshow(IMG_out);
    title("Original + " + string(b));
end


%%%%plots:TRANSFORMAÇOES GAMMA%%%%
figure('Name', 'Original + Correção Gamma ', 'NumberTitle', 'off')

subplot(2,3,1);
imshow(IMG);
title("Original");

GAMMAS = [1, 0.1, 0.5, 0.9, 1.1, 1.5];
for i=2:6
    subplot(2,3,i);
    gamma = GAMMAS(1, i) ;
    IMG_out = imadjust(IMG,[],[],gamma);
    imshow(IMG_out);
    title("gamma=" + string(gamma));
end



%%%%plots:EQUALIZAÇÃO%%%%
figure('Name', 'Original + Equalizada + Inversão de Escala e Respetivos Histogramas ', 'NumberTitle', 'off')

%IMAGENS
subplot(2,3,1);
imshow(IMG);
title("Original");


subplot(2,3,2);
IMeq=histeq(IMG);
imshow(IMeq)
title("Equalizada");

subplot(2,3,3);
IMinv=imcomplement(IMG);
imshow(IMinv)
title("Invertida");


%HISTOGRAMAS
subplot(2,3,4);
imhist(IMG);
title("Original");

subplot(2,3,5);
imhist(IMeq);
title("Equalizada");

subplot(2,3,6);
imhist(IMinv);
title("Invertida");