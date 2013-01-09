Fe = 8e3;

Xg = [0 200 300 400 500 800 1000 1300 1500 Fe/2];
Ygb = [-30 -30 -3 -3 -30 -30 -3 -3 -30 -30];
Ygh = [-30 -30 3 3 -30 -30 3 3 -30 -30];

Wn = [280 420 900 1400]; % définition des bandes du filtre (moyennes des limites)
Wn = Wn ./ (Fe / 2);
N = 200; % Ordre du filtre
coeff = fir1(N, Wn, 'DC-0');

N = 8192;
[H, W] = freqz(coeff, 1, N); % calcul du filtre

blanc = rand(1, N) - 0.5;

X = 1 : N/2;
X = Fe * X / N;
Y = 20 * log10(abs(fft(filter(coeff, 1, blanc))));

plot(W .* Fe / (2 * pi), 20 * log10(abs(H)), X, Y(1:N/2), Xg, Ygb, Xg, Ygh);
legend('Transmittance','bruit blanc filtre', 'gabarit min', 'gabarit max')
print -dpng RIF_1.png

plot(W .* Fe / (2 * pi), unwrap(10 * phase(H)) / 10)  %ca n'a aucun sens !
legend('phase')
% Mais c'est lineaire.
print -dpng RIF_2.png

t = 0 : 1/N : 1;
test = sin(2*pi*100*t) + sin(2*pi*350*t) + sin(2*pi*650*t) + sin(2*pi*1150*t) + sin(2*pi*1600*t);
t = Fe * t;
fft_test = 20*log10(abs(fft(test)));
f = 0 : N/2-1;
test_f = 20 * log10(abs(fft(filter(coeff, 1, test))));
plot(f(2:end), fft_test(2:N/2), f(2:end), test_f(2:N/2));
legend('signal de test', 'signal de test filtre')
print -dpng RIF_3.png
