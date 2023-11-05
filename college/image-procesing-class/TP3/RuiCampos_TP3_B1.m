function [] = RuiCampos_TP3_B1(name)
%% Reading Image
Io = imread(name);
%I = RuiCampos_TP3_A1(name, 0);
I = Io;
%% Building Structures
EEd3  = strel('disk', 3); 
EEd5  = strel('disk', 5);
EEd10 = strel('disk', 10);
%% Applying Operations
Ie3  = imerode(I,EEd3);   Id3  = imdilate(I,EEd3);
Ie5  = imerode(I,EEd5);   Id5  = imdilate(I,EEd5);
Ie10 = imerode(I,EEd10);  Id10 = imdilate(I,EEd10);

Ia3  = imopen(I,EEd3);    If3  = imclose(I, EEd3);
Ia5  = imopen(I,EEd5);    If5  = imclose(I, EEd5);
Ia10 = imopen(I,EEd10);   If10 = imclose(I, EEd10);
%% Graphing
figure('Name', 'Operaçoes Morfológicas')

subplot(3,4,1)   , imshow(Id3) , ylabel('R=3'), title('Dilatação')
subplot(3,4,1+4) , imshow(Id5) , ylabel('R=5')
subplot(3,4,1+8) , imshow(Id10), ylabel('R=10')

subplot(3,4,2)  ,  imshow(Ie3),  title('Erosão')
subplot(3,4,2+4),  imshow(Ie5)
subplot(3,4,2+8),  imshow(Ie10)

subplot(3,4,3)  ,  imshow(Ia3), title('Abertura')
subplot(3,4,3+4),  imshow(Ia5)
subplot(3,4,3+8),  imshow(Ia10)

subplot(3,4,4)  ,  imshow(If3), title('Fecho')
subplot(3,4,4+4),  imshow(If5)
subplot(3,4,4+8),  imshow(If10)
end