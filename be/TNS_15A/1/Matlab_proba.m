clear
%1)
Nc = 100;
N = 1000;
r = 1+randn(N,1)*(0.1)^(1/2);
h = hist(r,Nc);
h = h*Nc/((max(r)-min(r))*N);
%plot(h)
%hold
l = min(r):(max(r)-min(r))/Nc:max(r);
y = normpdf(l,1,sqrt(0.1));
%plot(y)

%3)
u = 1+rand(N,1);
v = hist(u,Nc);
v = v*Nc/((max(u)-min(u))*N);
plot(linspace(1,2,Nc),v)

%4)
x = sign(randn(N,1));
hist(x,Nc)
b = randn(N,1)*(0.001)^(1/2);
z = x+b;
hist(z,Nc)

%5) et 6)
f=0.125;
n = 0:N-1;
x = sin(2*pi*f*n);
z = x'+b;
hist(z,Nc)

%2-1)
nb=20;
p = rand();
x = rand(N,nb);
y = x<p;
mean(y);
p*(1-p);
var(y);

%2-2)
b = sum(y');
nb*p;
mean(b);
nb*p*(1-p);
var(b);

k = 10;
sum(b==k)/N;
nchoosek(nb,k)*(p^k)*(1-p)^(nb-k);

%2-3)

t = unidrnd(10,10,3);
mean(t(:,1) == t(:,2) & t(:,1) == t(:,3))
%find(()


