Zc = 50;
vp = 2E8;
d = 2;
f = 13.56E6;

g = j*2*pi*f/vp;
Yc = 1/Zc;

A = cosh(g*d);
B = Zc*sinh(g*d);
C = Yc*sinh(g*d);
D = cosh(g*d);
M = [A,B;C,D]

a = A;
b = B/Zc;
c = C/Yc;
d = D;

m = [a,b;c,d]
Z11 = A/C;
Z12 = (A*D-B*C)/C;
Z21 = 1/C;
Z22 = D/C;

Z = [Z11,Z12;Z21,Z22]

z11 = a/c;
z12 = (a*d-b*c)/c;
z21 = 1/c;
z22 = d/c;

z = [z11,z12;z21,z22]

S11 = (A+B/Zc-C*Zc-D)/(A+B/Zc+C*Zc+D);
S12 = 2*(A*D-B*C)/(A+B/Zc+C*Zc+D);
S21 = 2/(A+B/Zc+C*Zc+D);
S22 = (-A+B/Zc+C*Zc+D)/(A+B/Zc+C*Zc+D);

S = [S11,S12;S21,S22]

%Reciproque : det(M) == 1
det(M)
f=1E8:1E6:5E8;
plot(f,real(cosh(j*2*pi*f*d/vp)),f,imag(sinh(j*2*pi*f*d/vp)))
