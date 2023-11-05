function [] = RuiCampos_TP3_D2(name, L)
%% Reading Image/Creating video objects
Io = imread(name);

videoObj1 = VideoWriter('media.avi');   videoObj1.FrameRate = 4; open(videoObj1);
videoObj2 = VideoWriter('mediana.avi'); videoObj2.FrameRate = 4; open(videoObj2);
%% Writing Video
writeVideo(videoObj1, Io); writeVideo(videoObj2, Io) %first frame
disp('Rendering Video...')
if size(Io, 3) == 1
    %% If GRAYSCALE
    for l=1:L
        avg = ones(l)/l^2;    I = imfilter(Io, avg); 
        writeVideo(videoObj1, I);
        
        ord = 2*l-1;
     
        I = ordfilt2(Io, (ord*ord+1)/2 , true(l));
        writeVideo(videoObj2, I);
    end
   
else 
    %% IF RGB
    rIo = Io(:,:,1);
    gIo = Io(:,:,2);
    bIo = Io(:,:,3);
    
    for l=1:L
        avg = ones(l)/l^2;    
        I = imfilter(Io, avg); 
        writeVideo(videoObj1, I);
        
        ord = 2*l-1;
        if ord>L
            continue 
        end
        rI = ordfilt2(rIo, (ord*ord+1)/2 , true(ord));
        gI = ordfilt2(gIo, (ord*ord+1)/2 , true(ord));
        bI = ordfilt2(bIo, (ord*ord+1)/2 , true(ord));

        I = cat(3, rI, gI, bI);
        writeVideo(videoObj2, I);
    end
end
disp('Done!')
end
