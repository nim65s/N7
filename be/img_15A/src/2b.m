f = 535E6;
vp = 2E8;
g = (2*pi*f)./vp;
L = 0.0999;
D = 0.0603;

a1 = cosh(i*g*2);
b1 = sinh(i*g*2);
c1 = sinh(i*g*2);
d1 = cosh(i*g*2);

m1 = [a1,b1;c1,d1]

a2 = 1;
b2 = 0;
c2 = i*tan(g*L);
d2 = 1;

m2 = [a2,b2;c2,d2]

a3 = cosh(i*g*D);
b3 = sinh(i*g*D);
c3 = sinh(i*g*D);
d3 = cosh(i*g*D);

m3 = [a3,b3;c3,d3]

[a,b;c,d] = m1 * m2 * m3;
