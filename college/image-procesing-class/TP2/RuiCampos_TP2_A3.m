function [] = RuiCampos_TP2_A3(name)
IMG = imread(name);
if size(IMG, 3) == 1
    RuiCampos_TP2_A1(name)
elseif size(IMG, 3) == 3
    RuiCampos_TP2_A2(name)
else
    error("Image dimension is neither 1 nor 3. I cannot interpret this as greyscale or RGB!")
end

