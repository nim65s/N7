f = 3E8:1E6:8E8;
vp = 2E8;
g = (2*pi*f)./vp;
Zc = 50;
L1 = 0.0999;
D1 = 0.0603;
L2 = 0.2302;
D2 = 0.2112;

M1 = M(Zc,vp,2,f);
m1 = m_normalize(M1,Zc);

m21 = [1 0; i*tan(g*L1) 1];
m22 = [1 0; i*tan(g*L2) 1];

M31 = M(Zc,vp,D1,f);
M32 = M(Zc,vp,D2,f);
m31 = m_normalize(M31,Zc);
m32 = m_normalize(M32,Zc);

[a1,b1;c1,d1] = m11 * m21 * m31;
[a2,b2;c2,d2] = m12 * m22 * m32;

S111 = (a1+b1-c1-d1)./(a1+b1+c1+d1);
S112 = (a2+b2-c2-d2)./(a2+b2+c2+d2);
plot(f,abs(S111),f,1-abs(S111),f,abs(S112),f,1-abs(S112))
