function [numero] = dado()
%dado - retorna um n�mero entre 1 e 6 com prob 1/6
%   gera um n�mero real entre 0 e 1 com a distribui��o uniforme 
%   multiplicar por 6 altera o target para [0, 6]
%   int8 arredonda para baixo, prob([0,1]) = 1/6
r = rand();
numero = ceil(6*r);
end

