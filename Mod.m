% generates symbol sequence for bit sequence given a modulation size
function Symbols = Mod(Bits, mod_size)
    
    % binary case
    if mod_size == 2
        
        % assume all bits are ones
        Symbols = ones(1,length(Bits));
        
        % loop through all bits
        for n = 1:length(Bits)
            
            % replace ones with minus one when bit is 0
            if Bits(n) == 0
                Symbols(n) = -1;
            end
        end
        
    % 4QAM case
    elseif mod_size == 4
        
        % 4QAM requires a sequence of even length
        if mod(length(Bits),2) ~= 0
            
            % issue error if the length of data sequence is not even
            error("Expected Data Sequence of Even Length for 4QAM Modulation");
        end
        
        % create empty sequence of symbols
        Symbols = zeros(1,length(Bits)/2);
        
        % loop through bits two at a time
        for n = 1:length(Bits)/2
            
            % pick a symbol for every 2 bits
            if Bits(2*n-1) == 0 && Bits(2*n) == 0
                Symbols(n) = (1 + 1i)/sqrt(2);
            elseif Bits(2*n-1) == 0 && Bits(2*n) == 1
                Symbols(n) = (-1 + 1i)/sqrt(2);
            elseif Bits(2*n-1) == 1 && Bits(2*n) == 0
                Symbols(n) = (-1 - 1i)/sqrt(2);
            elseif Bits(2*n-1) == 1 && Bits(2*n) == 1
                Symbols(n) = (1 - 1i)/sqrt(2);
            end
        end
        
    % issue error if invalid modulation size is provided
    else
        error("Invalid Modulation Size");
    end
end