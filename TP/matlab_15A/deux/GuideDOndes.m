% Dimensions du guide
a=8;
b=5;

% génération de la grille
[x,y] = meshgrid(0:a/100:a,0:b/100:b);

% définition des fonctions
m1=1;n1=1;m2=2;n2=2;
Hz1=cos(m1*pi*x/a).*cos(n1*pi*y/b);
Ez1=sin(m1*pi*x/a).*sin(n1*pi*y/b);
Hz2=cos(m2*pi*x/a).*cos(n2*pi*y/b);
Ez2=sin(m2*pi*x/a).*sin(n2*pi*y/b);

%tracé 3D des fonctions
subplot(2,2,1)
meshc(Hz1)
title('mode TE 1,1')

subplot(2,2,2)
meshc(Ez1)
title('mode TM 1,1')

subplot(2,2,3)
meshc(Hz2)
title('mode TE 2,2')

subplot(2,2,4)
meshc(Ez2)
title('mode TM 2,2')
