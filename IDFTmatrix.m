% James Durtka
% EELE 477 (DSP) lab 11

% IDTF implementation using a matrix
function A = IDFTmatrix(N)
    A = zeros(N,N);
    indices = 0:(N-1);
    
    for k = indices
        for n = indices
            A(k+1,n+1) = exp(-j*2*pi*k*n/N);
        end
    end
    %not sure why this is necessary, but it is
    %A = A';