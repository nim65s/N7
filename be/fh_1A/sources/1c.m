f = 5E8;
Zc = 50;
Yp = 10E-12*j*2*pi*f + 1./(3.3E-9*j*2*pi*f) + 1/4000;

a1 = 1;
b1 = 0;
c1 = Yp*Zc;
d1 = 1;

f = 5E8:1E6:1E9;
Yp = 10E-12*j*2*pi*f + 1./(3.3E-9*j*2*pi*f) + 1/4000;

c1 = Yp/Zc

g = j*pi*f/1E8;

a2 = cosh(g*2);
b2 = sinh(g*2);
c2 = sinh(g*2);
d2 = cosh(g*2);

a = a1.*a2 + b1.*c2
b = a1.*b2 + b1.*d2
c = c1.*a2 + d1.*c2
d = c1.*b2 + d1.*d2

S11 = (a+b-c-d)./(a+b+c+d);
S21 = 2./(a+b+c+d);

plot(f,abs(S21),f,abs(S11))
