function [dado1, dado2] = par()
%par() simula o lançamento de dois dados
r = rand();
dado1 = ceil(6*r);

r = rand();
dado2 = ceil(6*r);
end

