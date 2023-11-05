function [segmentation] = RuiCampos_TP2_C2(name, S, M) 

%stuff to take care here
imO = imread(name);

[X,Y, Nb] = size(imO);

if Nb == 3
    im = rgb2gray(imO);
else
    im = imO;
end


%PARTITION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


dX = floor(X/S); dY = floor(Y/S);

if rem(X,S) == 0 && rem(Y,S) == 0
    rows    = dX*ones(1,S);
    columns = dY*ones(1,S);
elseif rem(X,S) ~= 0 && rem(Y,S) == 0
    rows    = dX*ones(1,S-1); rows = [rows, X-sum(rows)];      
    columns = dY*ones(1,S);
elseif rem(X,S) == 0 && rem(Y,S) ~= 0
    rows = dX*ones(1,S);        
    columns = dY*ones(1,S-1); columns = [columns, dY+1];
else
    rows = dX*ones(1,S-1);    rows = [rows, X-sum(rows)];      
    columns = dY*ones(1,S-1); columns = [columns, Y-sum(columns)];
end

partition = mat2cell(im, rows, columns);

%GLOBAL THRSH%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tg = graythresh(im); Tg8 = Tg*255;
imGT = im2bw(im, Tg); 


%LOCAL THRSH%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im2line = double(reshape(im, 1, []));
globalVAR = var(im2line); %globalMEAN = mean(im2line);

%globalSNR = globalMEAN/globalVAR;

for i=1:S
    for j=1:S
        block = partition{i,j};   seg2line = double(reshape(block, 1, []));
        localVAR = var(seg2line); localMEAN = mean(seg2line);
        
        [m,n] = size(block);
        
        %Tl = graythresh(block);
        
        %if non uniform, apply threshold locally
        if localVAR > 0.05*globalVAR 

            Tl = graythresh(block);
            BW = im2bw(block, Tl);
            partition{i,j} = BW;
            
        else %if too uniform, it's either ON or OFF
            
            if localMEAN<Tg8
                partition{i,j} = false(m,n);
            else
                partition{i,j} = true(m,n);
            end
            
            %comment: using Tg here brings the problems seen in global
            %thresholding back to the local thresholding - the program can't
            %decide if the darker parts of the gradient are part of the segment or not
            %I did not find a satisfactory solution using only the local mean. 
            
            %furthermore, I couldn't find an universal criterea that works
            %for all images, used the one that seems to work best with the
            %'TextDig.jpg' figure
        end
    end
end

segmentation = cell2mat(partition);

%Showing Results

if M==1
    figure('Name', name)
    subplot(1,3,1), imshow(imO), title('Imagem Original')
    subplot(1,3,2), imshow(imGT), title('Threshold Global')
    subplot(1,3,3), imshow(segmentation), title('Threshold Local')
end

end

