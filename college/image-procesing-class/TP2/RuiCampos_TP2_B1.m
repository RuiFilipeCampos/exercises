function [] = RuiCampos_TP2_B1(name)

Irgb = imread(name);

[I8,map1] = rgb2ind(Irgb,8, 'nodither');
[I8dither,map2] = rgb2ind(Irgb,8);
gray = rgb2gray(Irgb); 


figure('Name', 'Original'), imshow(Irgb), title('Original')

figure('Name', 'Indexada a 8 cores - sem dither')
image(I8), colormap(map1)
axis off, axis image
title('Indexada a 8 cores - sem dither')

figure('Name', 'Indexada a 8 cores - com dither')
image(I8dither), colormap(map2)
axis off, axis image
title('Indexada a 8 cores - com dither')


figure('Name', 'Escala Cinzento') 
imshow(gray), title('Escala Cinzento');

figure('Name', 'grey scale color map - jet') 
image(gray), colormap(jet)
axis off, axis image
title('grey scale color map - jet')


figure('Name', 'grey scale color map - spring') 
image(gray), colormap(spring)
axis off, axis image
title('grey scale color map - spring')

end

