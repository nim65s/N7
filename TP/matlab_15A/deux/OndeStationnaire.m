% Fréquence
f=100E6;

% Valeurs des composants
R1=5;
R2=10000;
L=100*10^-9;
C=1.5*10^-9;

% Dipoles équivalents
Z=R1+1i*2*pi*f*L;
Y=1/R2+1i*2*pi*f*C;

% Impédance caractéristique & constante de propagation
Zc=sqrt(Z/Y); g=sqrt(Z*Y);

% Constantes d'atténuation & de phase
a=real(g); b=imag(g);

% Charge \& Coefficient de réflexion
Zl=50+1i*10; Gl=(Zl-Zc)/(Zl+Zc);

% Tracé de l'allure de l'onde stationnaire sur une longueur de 10m
z=1:0.01:10;
V=abs(1+Gl*exp(-2*g*z));

subplot(2,1,1)
plot(z,V)
title({'Allure de londe Stationnaire';'Quand la ligne est terminée par la charge'})
xlabel('z (m)')

subplot(2,1,2)
plot(z,1)
title({'Allure de londe Stationnaire';...
    'Quand la ligne est terminée par limpédance caractéristique'})
xlabel('z (m)')
