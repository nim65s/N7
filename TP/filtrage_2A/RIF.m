Fe = 8e3; % Frequence d'echantillonage

Xg = [0 200 300 400 500 800 1000 1300 1500 Fe/2]; % frequences remarquables
Ygb = [-30 -30 -3 -3 -30 -30 -3 -3 -30 -30]; % limites basses du gabarit
Ygh = [-30 -30 3 3 -30 -30 3 3 -30 -30]; % limites hautes du gabarit

Wn = [280 420 900 1400]; % definition des bandes du filtre (moyennes des limites)
Wn = Wn ./ (Fe / 2); % normalisation
N = 200; % Ordre du filtre
coeff = fir1(N, Wn, 'DC-0');

N = 8192;
[H, W] = freqz(coeff, 1, N); % calcul du filtre

blanc = rand(1, N) - 0.5; % generation d'un bruit blanc

X = 1 : N/2;
X = Fe * X / N; % axe des absisses
Y = 20 * log10(abs(fft(filter(coeff, 1, blanc)))); % filtrage du bruit blanc, et passage en dB

plot(W .* Fe / (2 * pi), 20 * log10(abs(H)), X, Y(1:N/2), Xg, Ygb, Xg, Ygh);
legend('Transmittance','bruit blanc filtre', 'gabarit min', 'gabarit max'); xlabel('Frequence (Hz)'); ylabel('Gain ou Amplitude (dB)');
print -dpng RIF_1.png

plot(W .* Fe / (2 * pi), unwrap(10 * phase(H)) / 10) % multiplication & division: correction d'un bug
legend('phase'); xlabel('Frequence (Hz)'); ylabel('Phase');
% Mais c'est lineaire.
print -dpng RIF_2.png

t = 0 : 1/N : 1;
test = sin(2*pi*100*t) + sin(2*pi*350*t) + sin(2*pi*650*t) + sin(2*pi*1150*t) + sin(2*pi*1600*t);
t = Fe * t;
fft_test = 20*log10(abs(fft(test))); % transformee de fourier de la fonction de test a 5 diracs
f = 0 : N/2-1;
test_f = 20 * log10(abs(fft(filter(coeff, 1, test)))); % filtrage de cette fonction de test
plot(f(2:end), fft_test(2:N/2), f(2:end), test_f(2:N/2));
legend('signal de test', 'signal de test filtre'); xlabel('Frequence (Hz)'); ylabel('Amplitude (dB)');
print -dpng RIF_3.png
