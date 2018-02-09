% James Durtka
% EELE 477 (DSP) lab 11


%2.3 Windowing Effects
N = 100;

omegas = [0:0.001:1];

Ww = [];
for w = 1:length(omegas)
    ejw = 0;
    for n = [0:N-1]
        %note we must subtract 1 because of Matlab's indexing
        ejw = ejw + exp(-j*(omegas(w))*n);
    end
    Ww(w) = ejw;
end

figure

subplot(2,1,1)
plot(omegas, abs(Ww))
xlabel('Normalized (/\pi) \omega');
ylabel('|W(e^{j\omega})|');
title('Window function W(e^{j\omega}), N = 100');

subplot(2,1,2)
plot(omegas, phase(Ww))
xlabel('Normalized (/\pi) \omega');
ylabel('\angleW(e^{j\omega})');

% Since x[n] is just a cosine
%       cos((pi/4)*n)
% We know that its DTFT X(e^(j*omega)) will be a symmetric pair of deltas
%       delta((pi/4)) + delta(-(pi/4))

% Now, we can create x[n] as follows
ns_tr = [0:N-1];
x_tr = cos((pi/4)*ns_tr);
figure
%plot(ns_tr, x_tr)
[X,w] = DTFT(x_tr,512);

plot((1/pi)*w,abs(X))
title('DTFT of windowed x[n] = cos((\pi/4)*n), N = 100');
xlabel('Normalized (/\pi) \omega');
ylabel('|X_{tr}(e^{j\omega})|');

% Note that whereas the DTFT would be impulses, we now instead have
% something sinc-ish where the peaks of the sinc occur at +/- pi/4
% and there are ripples everywhere else (which would be zero for the DTFT)

% Unsurprisingly, increasing the window length results in a better
% approximation to the original function; greater N, steeper peaks.
% Using a Hamming window, as shown in the lab handout and explored in the
% previous lab, gives us much smaller ripples (but the rolloff is bigger
% for the same N)