function [] = RuiCampos_TP2_B3(name)

Irgb = imread(name);

if size(Irgb, 3) ~= 3
error("Input must be RGB image.")
end

R = Irgb(:,:,1); Req = histeq(R);
G = Irgb(:,:,2); Geq = histeq(G);
B = Irgb(:,:,3); Beq = histeq(B);

Irgb_eq = cat(3, Req, Geq, Beq);




Ihsv = rgb2hsv(Irgb);

H = Ihsv(:,:,1); 
S = Ihsv(:,:,2);
V = Ihsv(:,:,3); Veq = histeq(V);

Ihsv_eq = cat(3, H, S, Veq);
Irgb_hsv_eq = hsv2rgb(Ihsv_eq);

name = char(name);
figure('Name', name)
subplot(1,3,1), imshow(Irgb),    title('Original')
subplot(1,3,2), imshow(Irgb_eq), title('Equalizada em RGB')
subplot(1,3,3), imshow(Irgb_hsv_eq), title('Equalizada em HSV')


end

