classdef RuiCampos_TP6_signalObj < handle
    properties
        %% inputs
        Y    %signal amplitude in time (vector)
        Fs   %sampling frequency in Hz
        
        %% calculated by constructor method
        dt     %time interval between samples
        t      %corresponding time vector
        N      %signal size (number of samples)
        
        Fnorm  %normalized frequencies
        N2     %index of value closest to 0.5 in self.Fnorm
        
        Frad   %frequencies vector in radians
        F      % frequencies in kHz
        fft    %DFT of signal - 0 to pi
        fftABS %module of fft - 0 to pi
        fftPHA %module of phase in rad - 0 to pi
    end
    
    methods
        %% constructor method
        function self = RuiCampos_TP6_signalObj(Y, Fs, t0) %Fs in Hz
            %time domain stuff
            self.Y  = Y;
            self.Fs = Fs;
            
            self.N  = numel(Y);
            self.dt = 1 / self.Fs;
            
            t_final = self.dt*(self.N-1);
            self.t  = 0:self.dt:t_final;
            
            %frequency domain stuff
            self.Fnorm = self.t/t_final;
            
            [~, N2] = min(abs(self.Fnorm - .5));
            self.N2 = N2;
            
            self.fft = fft(self.Y, self.N);
            self.fft = self.fft(1:N2);
            self.fftABS = abs(self.fft);
            self.fftPHA = angle(self.fft);
            
            self.Fnorm = self.t/self.t(end);
            self.Fnorm = self.Fnorm(1:N2);
            
            self.Frad = self.Fnorm*2*pi;
            self.F    = self.Fnorm*self.Fs;
            
            if exist('t0', 'var')
                self.time_translation(t0)
            end
        end
        
        %% signal tools
        function time_translation(self, dt)
            self.t = self.t + dt;
        end
        
        function normalized_freq = HzToNorm(self, Hz)
            [~, k] = min(abs(self.F - Hz));
            normalized_freq = self.Fnorm(k);
        end
        
        %% custom slices
        function sliced = subsref(self, s)
            switch s(1).type
                case '.' %if first subscript is dot -> matlab handles it
                    try
                        sliced = builtin('subsref', self, s); 
                    catch %for methods with no returns
                        builtin('subsref', self, s)
                    end
                case '()' %if first subscript is not dot -> I handle it
                    try
                        indexes = cell2mat(s.subs);
                    catch 
                        error('Not Implemented.')
                    end
                    
                    t0 = indexes(1);
                    tf = indexes(end);
                    
                    [~, I0] = min(abs(self.t-t0)); %find index closest to t0
                    [~, If] = min(abs(self.t-tf)); %find index closest to tf

                    s.subs = {I0:If};

                    newY   =  builtin('subsref', self.Y, s);
                    sliced = RuiCampos_TP6_signalObj(newY, self.Fs);
                    sliced.time_translation(t0); %return new obj
                    
                case '{}'
                    error('Not Implemented')
            end
        end

        %% plot tools
        function plot_timeSlice(self, t0, tf)
            [~, I0] = min(abs(self.t-t0)); %find index closest to t0
            [~, If] = min(abs(self.t-tf)); %find index closest to tf
            %plot slices
            plot(self.t(I0:If) ,self.Y(I0:If))
            xlabel('Time(s)')
            ylabel('Amplitude(a.u.)')
        end
        
        function plot_time(self)
            plot(self.t ,self.Y)
            xlabel('Time(s)')
            ylabel('Amplitude(a.u.)')
        end
        
        function plot_fftABS(self, units)
            % units: "rad", "Hz", "kHz"
            switch units
                case "rad"
                    plot(self.Frad ,self.fftABS)
                    xlabel('Frequency(rad)')
                    ylabel('Amplitude(a.u.)')
                case "Hz"
                    plot(self.F, self.fftABS)
                    xlabel('Frequency(Hz)')
                    ylabel('Amplitude(a.u.)')
                case "kHz"
                    plot(self.F*1e-3, self.fftABS)
                    xlabel('Frequency(kHz)')
                    ylabel('Amplitude(a.u.)')
            end
        end
        
        function plot_fftPHA(self)
            plot(self.F, self.fftPHA)
            xlabel('Frequency(Hz)')
            ylabel('Phase(rad)')
        end
    end
end