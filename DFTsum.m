% James Durtka
% EELE 477 (DSP) lab 11

% DTF implementation using the definition (sum)
function [Xk] = DFTsum(xn)
    N = length(xn);
    ns = [0:N-1];
    Xk = [];
    for k = ns
        Xnk = 0;
        for n = ns
            Xnk = Xnk + (xn(n+1)*exp(-j*2*pi*k*n/N));
        end
        Xk(k+1) = Xnk;
    end
    Xk = (1/N)*Xk;