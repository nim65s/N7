clear;

Fe = 8e3;

Wn = [250 450 900 1400]; % définition des bandes du filtre (moyennes des limites)
Wn = Wn ./ (Fe / 2);
N = 100; % Ordre du filtre
coeff = fir1(N, Wn, 'DC-0');

N = 8192;
[H, W] = freqz(coeff, 1, N); % calcul du filtre

moyenne = - 0.5;
sigma = 1;
blanc = moyenne + sigma * rand(1, N);

X = 1 : N/2;
X = Fe * X / N;
Y = 20 * log10(abs(fft(filter(coeff, 1, blanc))));

figure
subplot(2, 1, 1);
plot(W .* Fe / (2 * pi), 20 * log10(abs(H)), X, Y(1:N/2))

subplot(2, 1, 2);
plot(W .* Fe / (2 * pi), unwrap(10 * phase(H)) / 10)  %ça n'a aucun sens !
% Mais c'est lineaire.

figure;
t = 0 : 1/N : 1;
test = sin(2*pi*100*t) + sin(2*pi*350*t) + sin(2*pi*650*t) + sin(2*pi*1150*t) + sin(2*pi*1600*t);
t = Fe * t;
fft_test = 20*log10(abs(fft(test)));
f = 0 : N/2-1;
test_f = 20 * log10(abs(fft(filter(coeff, 1, test))));
plot(f(2:end), fft_test(2:N/2), f(2:end), test_f(2:N/2));