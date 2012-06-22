f = 3E8:1E6:8E8;
vp = 2E8;
Zc = 50;
L1 = 0.0999;
D1 = 0.0603;
L2 = 0.2302;
D2 = 0.2112;

for i = 1:501
    g = (2*pi*f(i))./vp;
    M11 = M(Zc,vp,2,f(i));
    m11 = m_normalise(M11,Zc);

    m21 = [1 0; 1i*tan(g*L1) 1];
    m22 = [1 0; 1i*tan(g*L2) 1];

    M31 = M(Zc,vp,D1,f(i));
    M32 = M(Zc,vp,D2,f(i));
    m31 = m_normalise(M31,Zc);
    m32 = m_normalise(M32,Zc);

    m1 = m11 * m21 * m31;
    m2 = m11 * m22 * m32;
    a1 = m1(1,1);
    b1 = m1(1,2);
    c1 = m1(2,1);
    d1 = m1(2,2);
    a2 = m2(1,1);
    b2 = m2(1,2);
    c2 = m2(2,1);
    d2 = m2(2,2);

    S111(i) = (a1+b1-c1-d1)./(a1+b1+c1+d1);
    S112(i) = (a2+b2-c2-d2)./(a2+b2+c2+d2);
end
plot(f,abs(S111),f,1-abs(S111),f,abs(S112),f,1-abs(S112))
