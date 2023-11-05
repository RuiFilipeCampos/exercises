A = load_nii('MDR_TRN_001.nii.gz');
CT = RuiCampos_TP6_CTobj(A.img);
slices = [10 30 50 70 90 110];
figure
for i=1:6
    subplot(2,3,i),CT.show_slice(slices(i))
end