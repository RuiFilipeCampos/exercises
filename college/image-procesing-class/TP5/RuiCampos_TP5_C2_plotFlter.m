function [num,den] = RuiCampos_TP5_C2_plotFlter(FilterObj, W, graf)
    G = FilterObj.ScaleValues;
    g = G(end);  %ganho do output
    G(end) = []; 
    SOS    = FilterObj.SOSMatrix;
    SOS    = [SOS(:,1:3).*G...
              SOS(:,4:6)   ];        %multipicar apenas numeradores
          
    [num,den] = sos2tf(SOS);
    H = g*freqz(num, den, W);
    h = ifft(H);
    dB = 20*log10(abs(H));
    %% plot
    if graf==1
        %figure
        subplot(2,2,1),plot(W/pi,dB),            title('Gain'),            xlabel('w/\pi'), ylabel('dB')
        subplot(2,2,2),plot(W/pi,abs(H)),        title('Phase'),           xlabel('w/\pi'), ylabel('phase')
        subplot(2,2,3),plot(real(h)), title('Impulse Response'),xlabel('samples')
        subplot(2,2,4),zplane(num,den)
    end
end