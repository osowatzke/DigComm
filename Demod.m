% function determines bits from estimated symbols
function est_bits = Demod(est_sym)

    % all 4QAM symbols have an imaginary part
    % determine the modulation size base on the imaginary part of the first
    % symbol
    if imag(est_sym(1)) > 0
        mod_size = 4;
    else
        mod_size = 2;
    end

    % binary case
    if mod_size == 2
        
        % assume all bits are ones
        est_bits = ones(1,length(est_sym));
      
        % loop through all symbols
        for n = 1:length(est_sym)
            
            % assumption is wrong if symbol is -1
            if est_sym(n) == -1
                est_bits(n) = 0;
            end
        end
        
    % 4QAM case
    elseif mod_size == 4
        
        % there are twice as many bits as there are symbols in 4QAM
        est_bits = zeros(1,2*length(est_sym));
        
        % loop through all symbols to determine bits
        for n = 1:length(est_sym)
            
            % consider all four cases
            if real(est_sym) > 0 && imag(est_sym) > 0
                est_bits(2*n-1:2*n) = [0 0];
            elseif real(est_sym) < 0 && imag(est_sym) > 0
                est_bits(2*n-1:2*n) = [0 1];
            elseif real(est_sym) < 0 && imag(est_sym) < 0
                est_bits(2*n-1:2*n) = [1 0];
            else
                est_bits(2*n-1:2*n) = [1 1];
            end
        end
    end
end