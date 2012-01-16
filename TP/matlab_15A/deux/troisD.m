% Génération de la grille
[X,Y] = meshgrid(-pi:0.1:pi);

% Définition des fonctions
Z=(sin(2*X.^2+2*Y.^2))/(X.^2+Y.^2);
W=sin(X)*(sin(X^2+Y^2))/(X^2+Y^2);

% Tracé des trois fonctions sur une seule page
subplot(2,2,1)
meshc(Z)
title('mesh de Z')

subplot(2,2,2)
surf(W)
title('surf de W')

subplot(2,2,3)
sphere(100)
title('sphere')

subplot(2,2,4)
[X,Y,Z]=SPHERE(100);
mesh(X,Y,Z)
title('mesh de sphere')
