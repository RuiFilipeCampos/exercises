function [img_out] = RuiCamposTP1a_apply_grad2(img, Imin, Imax, theta)
%apply_grad creates gradient matrix and applies it by performing pointwise multiplication

N = length(img);
gradiente = ones(N);

dI = (Imax-Imin)/(N-1);
linha = Imin:dI:Imax;
%size(linha);

for x=1:N
    for y=1:N
        z = RuiCamposTP1a_grad(x,y,theta, N, Imin, Imax);
        gradiente(x,y) = z;
    end
end

%img = new_chess();
img = double(img);
img = img.*gradiente;

img_out = uint8(img);
imshow(img_out)
end

