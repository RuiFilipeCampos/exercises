%% creating signals and applying DFT
N  = 256;
n  = 0:N-1;
x1 = 2*n.*(0.9.^n);   TF1 = fft(x1, 512);
x2 = cos(6 *pi*n/N);  TF2 = fft(x2, 512);
x3 = cos(15*pi*n/N);  TF3 = fft(x3, 512);
%% s
lags = -N+1:N-1;

set_signals = [x1; x2; x3];
%set_transfo = [TF1; TF2; TF3];

pairs = [1 2; 1 3; 2 3];

for i=1:3
    i1 = pairs(i, 1); i2 = pairs(i,2);
    
    y  = set_signals(i1, :); 
    z  = set_signals(i2, :); 
    
    convYZ_time   = conv(y,z); %convolving directly in time domain
    LAGS          = -255:255;
    
    %max displacement is length of vector - 1
    %      [1 2 3 4]   
    %[4 3 2 1]          
    
    TFy = fft(y, 255+255+1); TFz = fft(z, 255+255+1); 
    %sampling the same number of points
    %as the number of points in the convolution 
    
    convYZ_fromDFT = ifft(TFy.*TFz);
    
     
    figure('Name', "Par x" + string(i1) + " e x" + string(i2))
    subplot(2,2, 1), plot(y)
    title("Sinal x_" + string(i1) + "[n]")
    xlabel('n')
    
    subplot(2,2, 2), plot(z)
    title("Sinal x_" + string(i2) + "[n]")
    xlabel('n')
   
    subplot(2,2, 3), plot(LAGS, convYZ_time )
    title("Convolução no Dom. Temporal")
    xlabel("Deslocamento (L)"), ylabel('x1[n]*x2[n]')
    
    subplot(2,2, 4), plot(LAGS, convYZ_fromDFT)
    title("Convolução pelo Dom. Freq")
    xlabel("Deslocamento (L)"), ylabel('F^{-1}( X_1 X_2 )')
end