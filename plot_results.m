function plot_results
    
    % SNR range in dB for mod size 2
    SNR = -2:2:8;
    
    % argument of Q function
    x = sqrt(10.^(SNR./10));
    
    % determine theoretical BER using erfc for Q function definition
    BER_ther = 1/2*erfc(x/sqrt(2));
    
    % empty array for actual BER 
    BER_act = zeros(1,length(SNR));
    
    % use transceiver function to determine BER at each SNR
    for k = 1:length(SNR) 
        BER_act(k) = transceiver(1e6, SNR(k), 2);
    end
    
    % plot results
    figure
    semilogy(SNR, BER_ther, SNR, BER_act)
    xlabel('SNR (dB)')
    ylabel('BER');
    title('Plot of Theoretical and Actual BER (Binary Case)')
    legend('Theoretical BER', 'Actual Ber', 'location', 'southwest')
    
    % SNR range in dB for mod size 4
    SNR = 2:2:10;
    
    % argument of Q function
    x = sqrt(10.^(SNR./10));
    
    % determine theoretical BER using erfc for Q function definition
    BER_ther = 1/2*erfc(x/sqrt(2));
    
    % empty array for actual BER 
    BER_act = zeros(1,length(SNR));
    
    % use transceiver function to determine BER at each SNR
    for k = 1:length(SNR) 
        BER_act(k) = transceiver(1e6, SNR(k), 4);
    end
    
    % plot results
    figure
    semilogy(SNR, BER_ther, SNR, BER_act)
    xlabel('SNR (dB)')
    ylabel('BER');
    title('Plot of Theoretical and Actual BER (4QAM)')
    legend('Theoretical BER', 'Actual Ber', 'location', 'southwest')
    
end