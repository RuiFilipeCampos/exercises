function [img] = RuiCamposTP1a_new_chess(N)
%new_chess creates the chess pattern

dN = N/8;
preto  = zeros(dN);
branco = 255*ones(dN);
img = zeros(N);

alternate = false;

for y = 1:dN:N
    if alternate == false
        for x = 1:2*dN:N
            img(x:x+dN-1,y:y+dN-1) = branco;
            img(x+dN:x+dN+dN-1,y:y+dN-1) = preto;
        end
        alternate = true;
        continue
    end
    for x = 1:2*dN:N
        img(x:x+dN-1,y:y+dN-1) = preto;
        img(x+dN:x+dN+dN-1,y:y+dN-1) = branco;
    end
    alternate = false;
end

img = uint8(img);
end

