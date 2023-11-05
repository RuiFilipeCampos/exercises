function [Vmax,Lmax]=RuiCampos_TP4_C2(x,y,graf)
%% calculate correlations
[ACx, lagACx] = xcorr(x,x); [CCxy, lagCCxy]  = xcorr(x,y);
[ACy, lagACy] = xcorr(y,y); [CCyx, lagCCyx]  = xcorr(y,x);
%% get energy from L=0 point of auto-correlation
energyX = sum((lagACx == 0).*ACx);
energyY = sum((lagACy == 0).*ACy);
%% find Vmax and Lmax from normalized cross correl
rho_xy        = CCxy/sqrt(energyX*energyY);
[Vmax, index] = max(rho_xy);
Lmax          = lagCCxy(1, index);
%Lmax = sum((rho_xy == Vmax).*lagCCxy);
%% ploting 
if graf==1
    subplot(3,2,1), stem(x), title('x[n]'), xlabel('n'), ylabel('Amplitude do Sinal')
    subplot(3,2,2), stem(y), title('y[n]'), xlabel('n'), ylabel('Amplitude do Sinal')

    subplot(3,2,3), stem(lagACx, ACx/energyX)
    title('Auto-correlação de x[n]')
    xlabel('n'), ylabel('Amplitude do Sinal')

    subplot(3,2,4), stem(lagACy, ACy/energyY)
    title('Auto-correlação de y[n]')
    xlabel('n'), ylabel('Amplitude do Sinal')

    subplot(3,2,5), stem(lagCCxy, CCxy/sqrt(energyX*energyY))
    title('Correlação Cruzada de x[n] com y[n]')
    xlabel('n'), ylabel('Amplitude do Sinal')

    subplot(3,2,6), stem(lagCCyx, CCyx/sqrt(energyX*energyY))
    title('Correlação Cruzada de y[n] com x[n]')
    xlabel('n'), ylabel('Amplitude do Sinal')
end
end

