clear all
fprintf('1a\n')
Zc = 50;
vp = 2E8;
d = 2;
f = 13.56E6;
M0 = M(Zc,vp,d,f)
m_normalise0 = m_normalise(M0,Zc)
Z = Z(M0)
z_normalise = z_normalise(m_normalise0)
S = S(M0, Zc)

%Reciproque : det(M) == 1
if det(M0) == 1
    fprintf('La matrice est r�ciproque\n')
end

f=1E8:1E6:5E8;
plot(f,real(cosh(1i*2*pi*f*d/vp)),f,imag(sinh(1i*2*pi*f*d/vp)))

fprintf('1b\n')
fprintf('1c\n')
f = 5E8;
Yp = 10E-12*1i*2*pi*f + 1./(3.3E-9*1i*2*pi*f) + 1/4000;

m1 = [1 0;Yp*Zc 1]

f = 5E8:1E6:1E9;
Yp = 10E-12*1i*2*pi*f + 1./(3.3E-9*1i*2*pi*f) + 1/4000;

clear S11 S21
for i = 1:501
    Yp = 10E-12*1i*2*pi*f(i) + 1./(3.3E-9*1i*2*pi*f(i)) + 1/4000;
    m1 = [1 0;Yp*Zc 1];
    
    M2 = M(Zc,vp,d,f(i));
    m2 = m_normalise(M2,Zc);

    m = m1*m2;
    a = m(1,1);
    b = m(1,2);
    c = m(2,1);
    d = m(2,2);

    S11(i) = (a+b-c-d)./(a+b+c+d);
    S21(i) = 2./(a+b+c+d);
end

plot(f,abs(S21),f,abs(S11))

fprintf('1d\n')
clear S11 S21
f = 5E7:5E5:5E8;
for i = 1:901
    vp = 2E8;
    g = (2*pi*f(i))./vp;

    m1 = [1 0; 1i*tan(g*2) 1];

    M2 = M(Zc,vp,2,f);
    m2 = m_normalise(M2,Zc);

    m = m1*m2;
    a = m(1,1);
    b = m(1,2);
    c = m(2,1);
    d = m(2,2);

    S11(i) = (a+b-c-d)./(a+b+c+d);
    S21(i) = (2)./(a+b+c+d);
end

plot(f,abs(S21),f,abs(S11))