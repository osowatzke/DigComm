% Top level MATLAB function
function BER = transceiver(Length,SNR,mod_size)
    
    % perform error checking of user input 
    
    % length argument must be equal to or greater than 1
    if Length < 1
        error("Function Requires that length >= 1");
    
    % mod_sizes of 2 and 4 are the only ones supported
    elseif mod_size ~= 2 && mod_size ~= 4
        error("Function Requires that mod_size be 2 or 4");
    
    % mod_size of 4 requires an even number of bits
    elseif mod_size == 4 && mod(Length,2) ~= 0
        error("Function Requires an Even Length Argument when mod_size = 4");
    end
    
    % generate random bit sequence 
    Bits = DataGeneration(Length);
    
    % generate symbols for bit sequence
    Symbols = Mod(Bits, mod_size);
    
    % generate additive complex noise with unit variance
    Noise = NoiseGeneration(length(Symbols));
    
    % different definitions of standard deviation for BPSK and 4QAM
    if mod_size == 2
        sigma = sqrt(1/10^(SNR/10));
    else
        sigma = sqrt(1/(2*10^(SNR/10)));
    end
    
    % received signal contains both Symbols and Noise
    y = Symbols + sigma.*Noise;
    
    % determine esitmated symbols
    est_sym = receiver(y,mod_size);
    
    % determine estimated bit sequence
    est_bits = Demod(est_sym);
    
    % determine number of errors in estimated bit sequence
    
    % initialize variable to store the number of errors
    num_errors = 0;
    
    % loop through bit sequence and count the number of errors
    for n = 1:length(Bits)
        if est_bits(n) ~= Bits(n)
            num_errors = num_errors + 1;
        end
    end
    
    % determine BER
    BER = num_errors/length(Bits);
end