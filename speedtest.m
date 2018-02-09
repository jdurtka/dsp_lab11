% James Durtka
% EELE 477 (DSP) lab 11

% Comparing the speed of DFTsum vs. DFTmatrix

N = 512;
dftmat_512 = DFTmatrix(N);

ns = [0:N-1];
xn = cos((2*pi/10).*ns);

t0 = cputime;
X1 = DFTsum(xn);
t1 = cputime;
X2 = (dftmat_512*(xn'))';
t2 = cputime;

t1-t0
t2-t1

%Results: for N=512 case, DFTsum takes 0.2031s and DFTmatrix method doesn't
%even register as a nonzero amount of time. In fact, it isn't until we
%compute the 4096-point DFT that we get:
%   time_DFTsum: 7.3750s
%   time_DFTmatrix: 0.0313s
%Prior to this, the matrix method appears to be instantaneous.