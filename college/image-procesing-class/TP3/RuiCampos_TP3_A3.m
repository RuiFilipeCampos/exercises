function [IB2, IB3] = RuiCampos_TP3_A3(name, graf)
%% Reading Image
Io = imread(name);
IB1 = RuiCampos_TP3_A1(name, 0);
%IEt = RuiCampos_TP3_A2(name, 0);

%% Getting Labels
[IEt, N] = bwlabel(IB1, 8); %using this instead of A2 because I need N
[x,y] = size(IEt);

%% Selecting Biggest Object
v1       = zeros(1, N); %vector for areas of each segment
identity = ones(x,y);   %just so I don't create a new ones() every iteration
for i=1:N
    A = IEt == i*identity; %turning label into ones
    v1(i) = sum(sum(A));   %summing ones to get area
end

[maximum, label] = max(v1); %index of maximum is its label in IEt

IB2 = IEt == label; %turning label into ones
%% Selecting Biggest Object Without Touching Margin
SI = IEt(3:x-2, 3:y-2); %selecting out margin

v2 = zeros(1, N); %new areas

identity = ones(x-4,y-4);
for i=1:N
    A = SI == i*identity;
    v2(i) = sum(sum(A));
end

vv    = v1==v2;   %selecting objects that changed area
newV1 = v1.* vv;  %excluding those objects - he who changes area, touches margin

[maximum, label] = max(newV1);
IB3 = IEt == label;
%% Graphing
if graf == 1
    figure
    subplot(2,2,1), imshow(Io),  title('Imagem Original')
    subplot(2,2,2), imshow(IB1), title('Segmentada Central')
    subplot(2,2,3), imshow(IB2), title('Maior Objeto')
    subplot(2,2,4), imshow(IB3), title('Maior Objeto sem Tocar nas Margens')
end
