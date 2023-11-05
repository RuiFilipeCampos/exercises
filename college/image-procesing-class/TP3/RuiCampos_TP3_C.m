function [] = RuiCampos_TP3_C(name)
%% First Frame

videoObj1 = VideoWriter('Erosao.avi');    videoObj1.FrameRate = 4;
videoObj2 = VideoWriter('Dilatacao.avi'); videoObj2.FrameRate = 4;
videoObj3 = VideoWriter('Abertura.avi');  videoObj3.FrameRate = 4;
videoObj4 = VideoWriter('Fecho.avi');     videoObj4.FrameRate = 4;

I = RuiCampos_TP3_A1(name, 0); Ii = 255*uint8(I);
open(videoObj1); writeVideo(videoObj1, Ii)
open(videoObj2); writeVideo(videoObj2, Ii)
open(videoObj3); writeVideo(videoObj3, Ii)
open(videoObj4); writeVideo(videoObj4, Ii)

disp('Rendering videos...')
for r=1:50
    EEd = strel('disk', r, 0);
    Ii  = imerode( I,EEd); Ii=255*uint8(Ii); writeVideo(videoObj1, Ii)
    Ii  = imdilate(I,EEd); Ii=255*uint8(Ii); writeVideo(videoObj2, Ii)
    Ii  = imopen(  I,EEd); Ii=255*uint8(Ii); writeVideo(videoObj3, Ii)
    Ii  = imclose( I,EEd); Ii=255*uint8(Ii); writeVideo(videoObj4, Ii)
end
disp('Done!')
end

