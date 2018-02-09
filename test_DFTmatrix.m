% James Durtka
% EELE 477 (DSP) lab 11

% Testing the IDFTsum vs. DFTmatrix
N = 10;
ns = [0:N-1];

%Delta function for N=10
x1_n = [ ones(1,1) zeros(1,N-1) ];

%1 for N=10
x2_n = ones(1,N);

%e^j*2*pi*n/10 for N=10
x3_n = exp(j*2*pi*(1/10)*ns);

x4_n = cos(2*pi*(1/10)*ns);

x1_dft_sum = abs(DFTsum(x1_n))
x1_dft_mat = abs(DFTmatrix(N)*(x1_n'))'

subplot(3,2,1)
stem(ns,x1_dft_sum);
title('X_i[k] by sum');
subplot(3,2,2)
stem(ns,x1_dft_mat);
title('X_i[k] by matrix');

x2_dft_sum = abs(DFTsum(x2_n))
x2_dft_mat = abs(DFTmatrix(N)*(x2_n'))'

subplot(3,2,3)
stem(ns,x2_dft_sum);
subplot(3,2,4)
stem(ns,x2_dft_mat);

x3_dft_sum = abs(DFTsum(x3_n))
x3_dft_mat = abs(DFTmatrix(N)*(x3_n'))'

subplot(3,2,5)
stem(ns,x3_dft_sum);
subplot(3,2,6)
stem(ns,x3_dft_mat);

%x4_dft_sum = abs(DFTsum(x4_n))
%x4_dft_mat = abs(DFTmatrix(N)*(x4_n'))'

%subplot(4,2,7)
%stem(ns,x4_dft_sum);
%subplot(4,2,8)
%stem(ns,x4_dft_mat);