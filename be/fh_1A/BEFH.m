Zc = 50;
vp = 2E8;
d = 2;
f = 13.56E8;

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

%Sans pertes : il nous manquerait une donnée...

f=1E8:1E6:5E8;
plot(f,real(cosh(j*2*pi*f*d/vp)),f,imag(sinh(j*2*pi*f*d/vp)))


% 1b)
Zant = 75-25i;
Pd = 10^6.3

Ze = Z11 - (Z12*Z21)/(Z22+Zant)

% Si le générateur était chargé par 50 Ohms, on aurait Pd=Eg^2/(8*Rc) TODO
% : c'est pas 4 ??
Rc = 50;
Eg = sqrt(8*Rc*Pd)
V1 = Eg*Ze/(Ze+Rc)
I1=V1/Ze

Sortie = inv(M)*[V1;I1];
V2 = Sortie(1)
I2 = -Sortie(2)


a1 = (V1 + Zc*I1)/2
a2 = (V2 + Zc*I2)/2

b1 = (V1 - Zc*I1)/2
b2 = (V2 - Zc*I2)/2

Gue = b1/a1
Gus = b2/a2

Pray = V2*conj(I2)/2
Pref = abs(b1)^2/2

Pf = Pc+Pr

RL = 20*log(Pd/Prf)
IL = 20*log(Pd/Pf)



% 1c)
f=500E6
Yp = 10E-9*j*2*pi*f + 1./(3.3E-6*j*2*pi*f) + 1/4000
x=10E-9*j*2*pi
y=3.3E-6*j*2*pi
z=1/4000
% (x*f+1./(y*f)+z)

% Faut la multiplier avec l'autre

A = 1;
B = 0;
C = Yp;
D = 1;

S11 = (A+B/Zc-C*Zc-D)/(A+B/Zc+C*Zc+D)
S12 = 2*(A*D-B*C)/(A+B/Zc+C*Zc+D);

f = 500E6:1E6:1E9;
plot(f,(-(x*f+1./(y*f)+z)*Zc)/(2+(x*f+1./(y*f)+z)*Zc))
plot(f,2*(x*f+1./(y*f)+z)./(2+(x*f+1./(y*f)+z)*Zc))
