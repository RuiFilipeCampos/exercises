%RuiCampos_TP6_D2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shows segmented slices of CT scan.
%Usage1: RuiCampos_TP6_D2(filename, number_of_slices)
%                        *filename -> str or char type with name of file that
%                        contains CT scan                     
%                        *number_of_slices -> number of equally spaced
%                        slices to show in subplot
%
%Recomended if CTobj is already in memory:
%Usage2: RuiCampos_TP6_D2([], number_of_slices, CTobj)
%                         *number_of_slices -> number of equally spaced
%                          slices to show in subplot
%                         *CTobj -> object from class RuiCampos_TP6_CTobj
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function RuiCampos_TP6_D2(filename, number_of_slices, CTobj)
if exist('CTobj', 'var')
    CT = CTobj;
else
    A  = load_nii(filename);
    CT = RuiCampos_TP6_CTobj(A.img);
end

step   = floor(CT.Nslices/number_of_slices);
linhas = ceil(number_of_slices/5);

fig = figure('Visible', 'off');
if number_of_slices>5
    for k=1:number_of_slices
        a = step*k;
        subplot(linhas, 5, k)
        lungs = CT.getLungs(a, 0);
        imshow(lungs)
        title("#" + string(a))
    end
else
    for k=1:number_of_slices
        a = step*k;
        subplot(1, number_of_slices, k)
        lungs = CT.getLungs(a, 0);
        imshow(lungs)
        title("#" + string(a))
    end
end
fig.Visible = 'on';
end
