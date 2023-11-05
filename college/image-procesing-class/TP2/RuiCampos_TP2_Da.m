function [TDR,TNR,FNR,FPR,J,H] = RuiCampos_TP2_Da(GT, AS)

%set operations
TP  = AS  & GT;    TN  = ~(AS  | GT); 
FP  = AS & (~GT);  FN  = (~AS) & GT; 

%cardinality
nTP = sum(sum(TP)); nTN = sum(sum(TN));
nFP = sum(sum(FP)); nFN = sum(sum(FN));

nGT = sum(sum(GT));

%calculating measures
TDR = nTP/nGT; TNR = nTN/nGT;
FNR = nFN/nGT; FPR = nFP/nGT;

J = nTP/(nFP+nTP+nFN);
H = (nFP+nFN)/(nFP+nTP+nFN);

end

