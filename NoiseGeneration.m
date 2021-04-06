% function generates complex white Gaussion noise with zero mean and 
% unit variance
function Noise = NoiseGeneration(Length)
    
    % generate real noise of with variance 1/sqrt(2)
    real_noise = 1/sqrt(2)*randn(1,Length);
    
    % generate complex noise with variance 1/sqrt(2)
    imag_noise = 1i/sqrt(2)*randn(1,Length);
    
    % sum both real and imaginary noise to get complex noise
    Noise = real_noise + imag_noise;
    
end
