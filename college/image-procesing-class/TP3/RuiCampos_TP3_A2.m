function [IEt] = RuiCampos_TP3_A2(name, graf)
%% Getting Images
Io = imread(name);
IB = RuiCampos_TP3_A1(name, 0);
%% Getting Labels
[IEt, N] = bwlabel(IB);

%% Graphing
titulo = "Imagem Etiquetada (#de obj = " + string(N) + ")"; 
titulo = char(titulo);
if graf==1
    figure
    subplot(1,3,1), imshow(Io), title('Imagem Original')
    subplot(1,3,2), imshow(IB), title('Segmentada Central')
    subplot(1,3,3), imshow(uint8(255*IEt/N), hot(255)), title(titulo)
end
whos
255*IEt/N
end
