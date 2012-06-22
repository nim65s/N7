f = 535E6;
vp = 2E8;
Zc = 50;
g = (2*pi*f)./vp;
L = 0.0999;
D = 0.0603;

M1 = M(Zc,vp,2,f);
m1 = m_normalise(M1,Zc);

m2 = [1 0; 1i*tan(g*L) 1];

M3 = M(Zc,vp,D,f);
m3 = m_normalise(M3,Zc);

m = m1 * m2 * m3;