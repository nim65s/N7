f = 3E8,1E6;8E8;
vp = 2E8;
g = (2*pi*f)./vp;
L1 = 0.0999;
D1 = 0.0603;
L2 = 0.2302;
D2 = 0.2112;

a1 = cosh(i*g*2);
b1 = sinh(i*g*2);
c1 = sinh(i*g*2);
d1 = cosh(i*g*2);

m1 = [a1,b1;c1,d1]

a21 = 1;
b21 = 0;
c21 = i*tan(g*L1);
d21 = 1;

m21 = [a21,b21;c21,d21]

a22 = 1;
b22 = 0;
c22 = i*tan(g*L2);
d22 = 1;

m22 = [a22,b22;c22,d22]

a31 = cosh(i*g*D1);
b31 = sinh(i*g*D1);
c31 = sinh(i*g*D1);
d31 = cosh(i*g*D1);

m31 = [a31,b31;c31,d31]

a32 = cosh(i*g*D2);
b32 = sinh(i*g*D2);
c32 = sinh(i*g*D2);
d32 = cosh(i*g*D2);

m32 = [a32,b32;c32,d32]

[a1,b1;c1,d1] = m11 * m21 * m31;
[a2,b2;c2,d2] = m12 * m22 * m32;

S111 = (a1+b1-c1-d1)./(a1+b1+c1+d1);
S112 = (a2+b2-c2-d2)./(a2+b2+c2+d2);
plot(f,abs(S111),f,1-abs(S111),f,abs(S112),f,1-abs(S112))
