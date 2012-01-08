function x = graph_S11_S21_pour_Yp(inf,pas,sup)

f0=inf:pas:sup;
Zc=50; omega=2*pi*f0;
R=4000; L=3.36E-9; C=10E-12;
Yp=1/R+1./(j*L*omega)+j*C*omega;

ay=1;
by=0;
cy=Zc*Yp;
dy=1;

dd=2;vp=2E8;
gamma=j*2*pi*f0/vp;

al=cosh(gamma*dd);
bl=sinh(gamma*dd);
cl=sinh(gamma*dd);
dl=cosh(gamma*dd);

a=al.*ay+bl.*cy;
b=al.*by+bl.*dy;
c=cl.*ay+bl.*cy;
d=cl.*by+bl.*dy;

denom=a+b+c+d;
S11=(a+b-c-d)./denom;
S12=2*(a.*d-b.*c)./denom;
S21=2./denom;
S22=(-a+b-c+d)./denom;

plot(f0,abs(S11),f0,abs(S21))
title('S11 et S21 en fonction de f0');
legend('|S11|','|S21|');
x=1;