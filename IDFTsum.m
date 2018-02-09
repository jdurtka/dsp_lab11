% James Durtka
% EELE 477 (DSP) lab 11

% DTF implementation using the definition (sum)
function [xn] = IDFTsum(Xk)
    N = length(Xk);
    ks = [0:N-1];
    xn = [];
    for n = ks
        xnk = 0;
        for k = ks
            xnk = xnk + (Xk(k+1)*exp(j*2*pi*k*n/N));
        end
        xn(n+1) = xnk;
    end
    