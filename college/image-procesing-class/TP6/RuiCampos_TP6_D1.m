%% get data
niiObj = load_nii('MDR_TRN_001.nii.gz');
CT = RuiCampos_TP6_CTobj(niiObj.img);
slice80 = CT.getSlice(80);
%% find lungs
noisy_slice = CT.add_noise(slice80, 0);   
%noisy_slice = imadjust(noisy_slice, [], [], 0.9); -> added step for general case
%% report 1 
figure
subplot(2,2,1), imshow(slice80),     title("Original slice 80")
subplot(2,2,2), imhist(slice80),     title("notice how populated the zero bin is")
subplot(2,2,3), imshow(noisy_slice), title("slice80 + noise") %+ gamma in general case
subplot(2,2,4), imhist(noisy_slice), title("those pixels are now spread out through the histogram")
%% threshold and selection
T = graythresh(noisy_slice);

binary = im2bw(noisy_slice, T);
binary = CT.remove_noise(binary, 0);          % multiply by a matrix with zeros in the outter region
body   = CT.findLargestSegment(binary, 1);    % get body

lungs_ = ~body;                               %invert
lungs  = CT.findLargestSegment(lungs_, 0);    %find first lung


figure
subplot(2, 2, 1), imshow(binary), title("Result of segmentation")
subplot(2, 2, 2), imshow(body),   title("the body is easy to extract")
subplot(2, 2, 3), imshow(lungs_), title("inverted body image")
subplot(2, 2, 4), imshow(lungs),  title("extracted the largest object that does not touch margin:")
