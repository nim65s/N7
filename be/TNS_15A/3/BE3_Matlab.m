%1)
teta = 4;
N = 500;
K = 500;
signal = (1./(1:N));
sigma = eye(N);
Y = generer(teta,signal,sigma,N,K)';
plot(Y(:,1));
hold
plot(mean(Y'));
plot(var(Y'));
%2)
[ teta_est, BRC ] = estimateur_mv(Y(:,1),signal,sigma,K);
%3)
mean(teta_est);
var(teta_est);
%4)OK
%5) Avec signal = (1./(1:N)); l'estimateur est moins efficace que avec le log précédent.

clear all
hold off
%2)1)
lambda = 2;
for N = 1:15;
    teta = exprnd(1/lambda);
    t = exprnd(1/teta,N,1);

    tetaMV(N) = N/(sum(t));
    tetaMMSE(N) = (N+1)/(lambda+sum(t));
    tetaMAP(N) = N/(lambda+sum(t));
    teta2(N) = teta
end
plot(1:15,tetaMV,1:15,tetaMMSE,1:15,tetaMAP,1:15,teta2)

%3)1)
clear all
N = 100;
A = 2;
f0 = 0.45;
phi = pi/5;
RSBdB = 10;
sigma2 = 10^(RSBdB/10);
n = 0:N-1;
b = sigma2*randn(1,N);
r = A*cos(2*pi*f0*n + phi) + b;
plot(r)
A_est = (2/N)*abs(r*exp(-1i*2*pi*f0*n)')
phi_est = atan((-r*sin(2*pi*f0*n)')/(r*cos(2*pi*f0*n)'))

%3)2)
for i=1:1000

    b = sigma2*randn(1,N);
    r = A*cos(2*pi*f0*n + phi) + b;
    A_est(i) = (2/N)*abs(r*exp(-1i*2*pi*f0*n)');
    phi_est(i) = atan((-r*sin(2*pi*f0*n)')/(r*cos(2*pi*f0*n)'));

end

hist( A_est);
hist( phi_est );
mean( A_est );
var( A_est );
mean( phi_est );
var( phi_est );

%3)3)
clear A_est
clear phi_est

RSBdB = linspace(-5,10,50)

for i=1:50
    
    sigma2(i) = A/(2*10^(RSBdB(i)/10));
    b = sigma2(i)*randn(1,N);
    r = A*cos(2*pi*f0*n + phi) + b;
    A_est(i) = (2/N)*abs(r*exp(-1i*2*pi*f0*n)');
    phi_est(i) = atan((-r*sin(2*pi*f0*n)')/(r*cos(2*pi*f0*n)'));

end

plot( A_est );
plot(phi_est);







