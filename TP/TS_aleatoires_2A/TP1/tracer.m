N = 100;
f = 1;
lambda = 0.01;
X = 1/f : 1/f : N/f;
[Y L] = telegraphistes(f,lambda,N);

[f, X2] = hist(L,1000)
bar(X2,f/trapz(X2,f));
hold on
plot (poisspdf(X, lambda),X);
hold off;