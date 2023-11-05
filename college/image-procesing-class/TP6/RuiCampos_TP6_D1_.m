A = load_nii('MDR_TRN_001.nii.gz');
CT = RuiCampos_TP6_CTobj(A.img);
slice80 = CT.getSlice(80);
%% segmentação global
[Nl, Nc] = size(slice80);

% add noise to increase variance of histogram
for i=1:Nl
    for j=1:Nc
        if (i-Nl/2)^2+(j-Nl/2)^2>(Nc/2)^2
            slice80(i,j) = rand;
        end
    end
end

T = graythresh(slice80); IB = im2bw(slice80, T);

%remove noise
for i=1:Nl
    for j=1:Nc
        if (i-Nl/2)^2+(j-Nl/2)^2>(Nc/2)^2
            IB(i,j) = 0;
        end
    end
end
%% slection
IBbody = RuiCampos_TP6_largestSegm(IB, 1);       %get body
IBlungs = ~IBbody;                              %invert
IBlungs = RuiCampos_TP6_largestSegm(IBlungs, 0); %find lungs
%% 
figure

subplot(1,2,1),  CT.show_slice(80), title("Original Image")
subplot(1,2,2), imshow(IBlungs),  title("LUNGS")



% BW = ~bwareaopen(~IBlarge, 30);
% subplot(1,2,1)
% imshow(BW)
% subplot(1,2,2)
% imshow(IBlarge)

% 
% %% Showing Original Data
% figure('Name', "Original Data")
% subplot(1,2,1), imshow(slice80), title("Imagem Original")
% subplot(1,2,2), imhist(slice80), title("Histograma")
% 
% 
% %%
% figure
% subplot(1,2,1), title("Largest object in original segm")
% imshow(IBlarge)
% subplot(1,2,2)
% imshow(~IBlarge),  title("inverted")