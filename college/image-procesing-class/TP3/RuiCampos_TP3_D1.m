function [] = RuiCampos_TP3_D1(name, f, g_min, g_max)
%% Reading Image/Creating and Opening Video Obj
Io = imread(name);
videoObj = VideoWriter('TGama.avi'); videoObj.FrameRate = 4; open(videoObj); 

%% Getting the right number of frames...
%if the number of frames is not divisible by 3, we're gonna have problems

r = rem(f,3);
if r ~= 0 
    f   = floor(f/3); 
    
    dg1 = (g_min-1) /(f-1);
    dg2 = (g_max-g_min)/(f-1);
    
    f = f + r;
    dg3 = (1-g_max)/(f-1);
else %otherwhise, I can just do the division
    f = f/3;
    
    dg1 = (g_min-1) /(f-1);
    dg2 = (g_max-g_min)/(f-1);
    dg3 = (1-g_max) /(f-1);
end

gamma = [1:dg1:g_min, g_min:dg2:g_max, g_max:dg3:1];
%size(gamma)
%% Rendering video
disp('Rendering Video...')
for g=gamma
   writeVideo(  videoObj, imadjust(Io,[],[],g)  ); 
end

close(videoObj)
disp('Done')
end

