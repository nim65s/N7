%1.1.1
m = [1 ; 0.5];
n=10000;
sigma = [2 0.5 ; 0.5 1];
Y=normmult(m,sigma,n);
%1.1.2
subplot(2,2,1)
hist(Y(:,1),100)
subplot(2,2,2)
hist(Y(:,2),100)
%1.1.3
m'
mean(Y)
sigma
cov(Y)

%1.2.1
lambda=5;
clear X;
for i = 1:n
    Y = rand(size(m)); 
    X(i,:)=fmu(Y,lambda);
end
%1.2.2
1/lambda
mean(X)
1/lambda^2
var(X)
subplot(2,2,3)
hist(X(:,1),100)
subplot(2,2,4)
hist(X( :,2),100)

%2.1.
N = 100000;
s = (0.5)^(1/2);
b = s*randn(N,1);
x = rand(N,1) < 0.5;
z = x + b;
%2.2
length(find(z<0.5 & x == 1));
%2.3
length(find(z>0.5 & x == 0));
prob_erreur_est(N,s)
%2.4
clear y
for s = 1:100
    y(s) =prob_erreur_est(N,s/10);
end
plot(0.1:0.1:10,y)
hold
%2.5
clear z
for s = 1:100
    z(s) =prob_erreur_th(N,s/10);
end
plot(0.1:0.1:10,z)