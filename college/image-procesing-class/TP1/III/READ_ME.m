name  = 'US.jpg';
noise = 0.8;

IMG = imread(name);

IMGn1 = imnoise(IMG, 'salt & pepper', noise);

avgF3 = [1 1 1; 1 1 1; 1 1 1]/9;
avgF5 = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1]/25;

IMGF3 = imfilter(IMG, avgF3);
IMGF5 = imfilter(IMG, avgF5);

IMGmdn3 = ordfilt2(IMG, (3*3+1)/2 ,true(3));
IMGmdn5 = ordfilt2(IMG, (5*5+1)/2 ,true(5));


[M,N]=size(IMG);

figure('Name', 'Filters')

subplot(2,3,1)
imshow(IMG)
title('Original')

subplot(2,3,2)
ABS = abs(IMG-IMGn1);
ABS = reshape(ABS, [1,M*N]);
avg = mean(ABS);
imshow(IMGn1)
title('Noise ' + string(avg))

subplot(2,3,3)
ABS = abs(IMG-IMGF3);
ABS = reshape(ABS, [1,M*N]);
avg = mean(ABS);
imshow(IMGF3)
title('Média 3x3 ' + string(avg))

subplot(2,3,4)
ABS = abs(IMG-IMGF5);
ABS = reshape(ABS, [1,M*N]);
avg = mean(ABS);
imshow(IMGF5)
title('Média 5x5 ' + string(avg))

subplot(2,3,5)
ABS = abs(IMG-IMGmdn3);
ABS = reshape(ABS, [1,M*N]);
avg = mean(ABS);
imshow(IMGmdn3)
title('Mediana 3x3 ' + string(avg))

subplot(2,3,6)
ABS = abs(IMG-IMGmdn5);
ABS = reshape(ABS, [1,M*N]);
avg = mean(ABS);
imshow(IMGmdn5)
title('Mediana 5x5 '  + string(avg))

