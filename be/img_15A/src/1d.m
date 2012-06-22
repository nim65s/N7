f = 5E7:5E5:5E8;
vp = 2E8;
g = (2*pi*f)./vp;

a1 = 1;
b1 = 0;
c1 = i*tan(g*2);
d1 = 1;

a2 = cosh(i*g*2);
b2 = sinh(i*g*2);
c2 = sinh(i*g*2);
d2 = cosh(i*g*2);

a = a1.*a2 + b1.*c2
b = a1.*b2 + b1.*d2
c = c1.*a2 + d1.*c2
d = c1.*b2 + d1.*d2

S11 = (a+b-c-d)./(a+b+c+d);
S21 = (2)./(a+b+c+d);

plot(f,abs(S21),f,abs(S11))
