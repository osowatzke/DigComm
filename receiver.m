% function returns estimated symbols from noisy received signal
function est_sym = receiver(y, mod_size)
    
    % generate empty sequence of estimated symbols
    est_sym = zeros(1,length(y));
    
    % binary case
    if mod_size == 2
        
        % loop through each of the received symbols
        for n = 1:length(y)
            
            % determine if the received symbol should be a -1 or a 1
            if real(y(n)) < 0
                est_sym(n) = -1;
            else
                est_sym(n) = 1;
            end
        end
    
    % 4 QAM case
    elseif mod_size == 4
        
        % loop through each of the received symbols
        for n = 1:length(y)
            
            % make a decision about the real part of the symbol
            if real(y(n)) < 0
                est_sym(n) = -1/sqrt(2);
            else
                est_sym(n) = 1/sqrt(2);
            end
            
            % make a decision about the imaginary part of the symbol
            if imag(y(n)) < 0
                est_sym(n) = est_sym(n) - 1i/sqrt(2);
            else
                est_sym(n) = est_sym(n) + 1i/sqrt(2);
            end
        end
    end
end
