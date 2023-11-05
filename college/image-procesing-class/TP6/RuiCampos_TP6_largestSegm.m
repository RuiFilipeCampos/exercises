function [IBlarge] = RuiCampos_TP6_largestSegm(IB, allow_margin)
if allow_margin == 1
    [IEt, N] = bwlabel(IB, 4);
    [x,y] = size(IEt);
    
    
    %% selecting largest object
    v1       = zeros(1, N);  %vector for areas of each segment
    identity = ones(x,y);   %just so I don't create a new ones() every iteration
    for i=1:N
        A = IEt == i*identity; %turning label into ones
        v1(i) = sum(sum(A));   %summing ones to get area
    end
    
    [~, label] = max(v1); %index of maximum is its label in IEt
    
    IBlarge = IEt == label;   %turning label into ones
    
    
else
    %% etiquetas
    [IEt, N] = bwlabel(IB, 4);
    [x,y] = size(IEt);
    
    
    %% selecting largest object
    v1       = zeros(1, N);  %vector for areas of each segment
    identity = ones(x,y);   %just so I don't create a new ones() every iteration
    for i=1:N
        A = IEt == i*identity; %turning label into ones
        v1(i) = sum(sum(A));   %summing ones to get area
    end
    
    %[~, label] = max(v1); %index of maximum is its label in IEt
    
    %IBlarge = IEt == label;   %turning label into ones
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
    
    [~, label] = max(newV1);
    IBlarge = IEt == label;
end
end

