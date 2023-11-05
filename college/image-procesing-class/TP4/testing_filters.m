Ref1 = 1:20; Ref2 = 20:-1:1; Ref3 = ones(1,20);Ref4 = [10:-1:1 1:10];

Ref5 = [1:10, 10:-1:1 ];   Ref6 = (1:20).^(-1);  
A = zeros(1,20)
RuiCampos_TP4_C3([A,Ref1,A, Ref2,A,Ref3,A,Ref4,A,Ref5,A])