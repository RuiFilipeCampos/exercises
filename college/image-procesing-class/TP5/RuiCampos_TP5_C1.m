load("RuiCampos_TP5_filtros")
w =0:.01:pi;

figure('Name', 'Low Pass')
RuiCampos_TP5_C2_plotFlter(LP,w, 1);
figure('Name', 'High Pass')
RuiCampos_TP5_C2_plotFlter(HP,w, 1);
figure('Name', 'Band Pass')
RuiCampos_TP5_C2_plotFlter(BP,w, 1);
figure('Name', 'Band Stop')
RuiCampos_TP5_C2_plotFlter(BS,w, 1);