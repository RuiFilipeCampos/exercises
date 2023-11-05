
%For large signals(L>100) it works best if the signals are spaced out
%for example
%A = zeros(1,20)
%x = [A, 1:20, A, 1:1:10,10:-1:1, A, 10:-1:1, 1:10,A, (1:20).^(-1)]
      
%x:       one dimensional vector (signal, it is assumed that first element corresponds to n=1)
%output:  if signal length < 100 returns number reference signal
%         if signal lenght > 100 returns table of found signals

function [output] = RuiCampos_TP4_C3(x)
%% checking if input is too small
if numel(x)<20
    error("Signal is too small")
end
%% creating references and reference set
N    = 20;
ref1 = 1:20;                      ref1 = ref1/sum(ref1);
ref2 = 20:-1:1;                   ref2 = ref2/sum(ref2);
ref3 = [zeros(1,10), ones(1,10)]; ref3 = ref3/sum(ref3);
ref4 = [1:10, 10:-1:1];           ref4 = ref4/sum(ref4);
ref5 = [10:-1:1, 1:10];           ref5 = ref5/sum(ref5);
ref6 = (1:20).^(-1);              ref6 = ref6/sum(ref6);

ref_set = [ref1; ref2; ref3; ref4; ref5; ref6];
num_ref = size(ref_set, 1);
%% if signal is small, look for one reference
if size(x, 2) < 5*N
    %% testing x against references
    table = zeros(num_ref, 2);
    
    
    %"table" contents
    % Vmax | Lmax
    % .4   | 5     -> ref 1
    % ...  | ...   -> ref 2
    %
    %the signal is implicitally identified by the line index of the table
    
    figure
    for i=1:num_ref
        %% search for ref in signal x and store best correlation
        ref         = ref_set(i,:);
        [Vmax,Lmax] = RuiCampos_TP4_C2(x,ref,0);
        table(i,:)  = [Vmax,Lmax];
        %% graph the reference w/ max corr. value
        subplot(5,2,i), stem(ref), xlabel('n'), ylabel('Signal Amplitude')
        title("Ref. #" + string(i) ...
            + " - Max. da Correlação com x[n]  = " + string(Vmax))
    end
    
    %% graph input
    subplot(5,1,4), stem(x)
    xlabel('n'), ylabel('Signal Amplitude'), title("Input x[n]")
    %% get best match and graph it
    [~, ref_index] = max(table(:,1));
    
    subplot(5,1,5), stem( ref_set(ref_index,:) )
    title("Referência Escolhida = Ref #" + string(ref_index))
    xlabel('n'), ylabel('Signal Amplitude')
    output = ref_index;
else %% if signal is large
    table         = zeros(num_ref, 2);
    found_signals = []; %did not allocate because I cannot predict how many signals will be found
    
    y = x; %so that x is not modified.

    while sum(y>0)>=20
        %% construct table
        for i=1:num_ref
            ref = ref_set(i,:);
            [Vmax,Lmax] = RuiCampos_TP4_C2(y,ref,0);
            table(i,:)  = [Vmax,Lmax];
        end
        %% find best match and locate it in x[n]
        [Vmax, ref_index] = max(table(:,1)); %get max
        n_match       = table(ref_index, 2) + 1; 
        found_signals = [found_signals; ref_index, Vmax, n_match, y(n_match)];
        
        y(1, n_match:n_match+N-1) = zeros(1,N); %remove the detected signal
    end
    %% plot x with detected signals labeled
    figure, hold on
    stem(x), title('Input'), ylabel('x[n]'), %xlabel('n')
    %% labels
    for i=1:size(found_signals, 1)
        ref_index = found_signals(i,1);
        x_pos     = found_signals(i,3);
    
        text(x_pos, -1, "Ref #" + string(ref_index))
    end
    %% show references for comparison
    figure
    for i=1:6
        subplot(2,3,i), stem(ref_set(i,:)), title("Ref #" + string(i))
        xlabel('n'), ylabel('Amplitude')
    end
    %% create table for output
    output = array2table(found_signals(:,1:3), ...
                         'VariableNames', {'Ref_Number', 'Vmax', 'Location_in_x'});
end
end
