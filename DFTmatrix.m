% James Durtka
% EELE 477 (DSP) lab 11

% DTF implementation using a matrix
function A = DFTmatrix(N)
    A = zeros(N,N);
    indices = 0:(N-1);
    
    for k = indices
        for n = indices
            A(k+1,n+1) = (1/N)*exp(-j*2*pi*k*n/N);
        end
    end
    %not sure why this is necessary, but it is
    A = A';