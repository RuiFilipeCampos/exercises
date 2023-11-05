function [text] = RuiCampos_TP2_B4a(img)
%function to help me construct the titles
%(1) M�dia em R, G, B, H, S, V;
%(2) Desvio padr�o em R, G, B, H, S, V;
%(3) Min e Max em R, G, B, H, S, V.

img   = reshape(img,1,[]);
img   = double(img);


media = string(mean(img));
sd    = string(std(img) );
m     = string(min(img) );
M     = string(max(img) );

text1 = "Mean = " + media + newline;
text2 = "M�n = " + m + newline;
text3 = "Max = " + M + newline;
text4 = "std = " + sd ;

text = text1 + text2 + text3 + text4;

end

