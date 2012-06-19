clear all
s = 0.1;
N = 10;
A1 = 1;
A2 = 2;
A3 = 3;
t1 = 1;
t2 = 1;
while t1 == 1 | t1 == t2 | t2 == N
    t0 = (N-1)*rand(2,1);
    t1 = 1+floor(min(t0));
    t2 = 1+floor(max(t0));
end
t0 = [t1 t2]
x(1:t1) = A1;
x(t1:t2) = A2;
x(t2:N) = A3;
b = s*randn(1,N);
y = x+b
%f0 = f(t0)