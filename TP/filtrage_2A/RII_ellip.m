Fe = 8e3;

Xg = [0 200 300 400 500 800 1000 1300 1500 Fe/2];
Ygb = [-30 -30 -3 -3 -30 -30 -3 -3 -30 -30];
Ygh = [-30 -30 3 3 -30 -30 3 3 -30 -30];

[N1, Wn1] = ellipord([2*300/Fe 2*400/Fe], [2*200/Fe 2*500/Fe], 3, 30);
[N2, Wn2] = ellipord([2*1000/Fe 2*1300/Fe], [2*800/Fe 2*1500/Fe], 3, 30);
[B1, A1] = ellip(N1, 3, 35, Wn1);
[B2, A2] = ellip(N2, 3, 35, Wn2);

N = 8192;
[H1, W] = freqz(B1, A1, N); % calcul des filtres
[H2, W] = freqz(B2, A2, N);

blanc = rand(1, N) - 0.5;

X = 1 : N/2;
X = Fe * X / N;
Y1 = 20 * log10(abs(fft(filter(B1, A1, blanc))));
Y2 = 20 * log10(abs(fft(filter(B2, A2, blanc))));

Y = Y1 + Y2;
H = H1 + H2;
plot(W .* Fe / (2 * pi), 20 * log10(abs(H)), X, Y(1:N/2), Xg, Ygb, Xg, Ygh)
legend('Transmittance','bruit blanc filtre', 'gabarit min', 'gabarit max'); xlabel('Frequence (Hz)'); ylabel('Gain ou Amplitude (dB)');
print -dpng ell_1.png

plot(W .* Fe / (2 * pi), unwrap(10 * phase(H)) / 10)  %ça n'a aucun sens !
legend('phase'); xlabel('Frequence (Hz)'); ylabel('Phase');
% Mais c'est pas lineaire.
print -dpng ell_2.png

figure;
t = 0 : 1/N : 1;
test = sin(2*pi*100*t) + sin(2*pi*350*t) + sin(2*pi*650*t) + sin(2*pi*1150*t) + sin(2*pi*1600*t);
t = Fe * t;
fft_test = 20*log10(abs(fft(test)));
f = 0 : N/2-1;
test_f1 = 20 * log10(abs(fft(filter(B1, A1, test))));
test_f2 = 20 * log10(abs(fft(filter(B2, A2, test))));
test_f = test_f1 + test_f2;
plot(f(2:end), fft_test(2:N/2), f(2:end), test_f(2:N/2));
legend('signal de test', 'signal de test filtre'); xlabel('Frequence (Hz)'); ylabel('Amplitude (dB)');
print -dpng ell_3.png
