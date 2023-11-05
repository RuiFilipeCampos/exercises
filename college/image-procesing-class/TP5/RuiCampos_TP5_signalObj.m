classdef RuiCampos_TP5_signalObj
    properties
        x
        fft
        n
        N
        w
        fft_pha
        fft_abs
        error
    end
    
    methods        
        function self = RuiCampos_TP5_signalObj(n,val)
            if nargin == 2
                self.x = val;
                self.n   = n;
                self.N = numel(self.n);
                
                self.fft = fft(self.x);
                
                self.w   = 2*pi*self.n/self.N;            
                
                self.fft_abs = log10(abs(self.fft));
                self.fft_pha = angle(self.fft);
            end
        end
        
        function [] = plot(self)
            plot(self.n, self.x)
            xlabel('n')
            ylabel('Amplitude')
        end
        function [] = plot_fft(self)
            plot(self.w(1:self.N/2)/pi     ,...
            self.fft_abs(1:self.N/2))
            xlabel('w/\pi')
            ylabel('DFT Amplitude(log10)')
        end
        function [] = plot_fft2(self)
            plot(self.w/pi,  self.fft_abs)
            xlabel('w/\pi')
            ylabel('DFT Amplitude(log10)')
        end

    end
end