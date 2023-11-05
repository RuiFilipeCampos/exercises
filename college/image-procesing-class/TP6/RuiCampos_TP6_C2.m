%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Usage 1: RuiCampos_TP6_C2(filename, NL, NC)
%Usage 2: RuiCampos_TP6_C2([], NL, NC, CTobj) -> reccomended if CT object is
%                                                already in memory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function RuiCampos_TP6_C2(filename, NL, NC, CTobj)
N = NL*NC;
fig = figure('Visible', 'Off');

    if exist('CTobj', 'var')
        CT = CTobj;
        step = floor(CT.Nslices/N);
        
        for k=1:N
            subplot(NL, NC, k),CT.show_slice(k*step)
        end
        fig.Visible = 'On';
    else
        A = load_nii(filename);
        img = A.img;
        Nslices = size(img, 3);
        step = floor(Nslices/N);
        str = "Slice #";
        
        for k=1:N
            a = step*k;
            subplot(NL, NC, k)
            slice = (img(:, :, a) + 3024)/6100;
            imshow(slice)
            title(str + string(a))
        end
        
        fig.Visible = 'on';
    end
    
end

