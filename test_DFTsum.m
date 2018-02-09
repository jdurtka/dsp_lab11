% James Durtka
% EELE 477 (DSP) lab 11

% Testing the DTFsum and IDFTsum functions

N = 10;
ns = [0:N-1];

%Delta function for N=10
x1_n = [ ones(1,1) zeros(1,N-1) ];

%1 for N=10
x2_n = ones(1,N);

%e^j*2*pi*n/10 for N=10
x3_n = exp(j*2*pi*(1/10)*ns);

x4_n = cos(2*pi*(1/10)*ns);

subplot(4,3,1)
stem(ns,abs(x1_n));
title('x_i[n]');
subplot(4,3,2)
stem(ns,abs(DFTsum(x1_n)));
title('X_i[k]');
subplot(4,3,3)
stem(ns,abs(IDFTsum(DFTsum(x1_n))));
title('X_i[k]inverted back to x[n]');

subplot(4,3,4)
stem(ns,abs(x2_n));
subplot(4,3,5)
stem(ns,abs(DFTsum(x2_n)));
subplot(4,3,6)
stem(ns,abs(IDFTsum(DFTsum(x2_n))));
ylim([0 1])

subplot(4,3,7)
stem(ns,abs(x3_n));
subplot(4,3,8)
stem(ns,abs(DFTsum(x3_n)));
subplot(4,3,9)
stem(ns,abs(IDFTsum(DFTsum(x3_n))));
ylim([0 1])

subplot(4,3,10)
stem(ns,abs(x4_n));
subplot(4,3,11)
stem(ns,abs(DFTsum(x4_n)));
subplot(4,3,12)
stem(ns,abs(IDFTsum(DFTsum(x4_n))));
ylim([0 1])