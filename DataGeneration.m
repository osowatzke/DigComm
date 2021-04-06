% function generates a random data sequence of zeros and ones with
% Length bits
function Bits=DataGeneration(Length)
    Bits = randi([0,1],1,Length);
end