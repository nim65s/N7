clear all
fprintf('1a\n')
Zc = 50;
vp = 2E8;
d = 2;
f = 13.56E6;
M = M(Zc,vp,d,f)
m_normalise = m_normalise(M,Zc)
Z = Z(M)
z_normalise = z_normalise(m_normalise)
S = S(M, Zc)

%Reciproque : det(M) == 1
if det(M) == 1
    fprintf('La matrice est réciproque\n')
end

f=1E8:1E6:5E8;
plot(f,real(cosh(1i*2*pi*f*d/vp)),f,imag(sinh(1i*2*pi*f*d/vp)))

fprintf('1b\n')
fprintf('1c\n')
f = 5E8;
Yp = 10E-12*1i*2*pi*f + 1./(3.3E-9*1i*2*pi*f) + 1/4000;

a1 = 1;
b1 = 0;
c1 = Yp*Zc;
d1 = 1;

m1 = [a1 b1;c1 d1]

f = 5E8:1E6:1E9;
Yp = 10E-12*1i*2*pi*f + 1./(3.3E-9*1i*2*pi*f) + 1/4000;

c1 = Yp/Zc;

g = 1i*pi*f/1E8;

a2 = cosh(1i*g*2);
b2 = sinh(1i*g*2);
c2 = sinh(1i*g*2);
d2 = cosh(1i*g*2);

m2 = [a2 b2;c2 d2];

a = a1.*a2 + b1.*c2;
b = a1.*b2 + b1.*d2;
c = c1.*a2 + d1.*c2;
d = c1.*b2 + d1.*d2;

m = [a b;c d];

%TODO
S11 = (a+b-c-d)./(a+b+c+d);
S21 = 2./(a+b+c+d);

plot(f,abs(S21),f,abs(S11))

fprintf('1d\n')
f = 5E7:5E5:5E8;
vp = 2E8;
g = (2*pi*f)./vp;

a1 = 1;
b1 = 0;
c1 = 1i*tan(g*2);
d1 = 1;

a2 = cosh(1i*g*2);
b2 = sinh(1i*g*2);
c2 = sinh(1i*g*2);
d2 = cosh(1i*g*2);

a = a1.*a2 + b1.*c2;
b = a1.*b2 + b1.*d2;
c = c1.*a2 + d1.*c2;
d = c1.*b2 + d1.*d2;

S11 = (a+b-c-d)./(a+b+c+d);
S21 = (2)./(a+b+c+d);

plot(f,abs(S21),f,abs(S11))