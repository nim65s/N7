% Définition de l'intervalle d'étude
x=0:0.005:10;

% Définition des deux équations du système
y1=sin(x)-0.25;
y2=cos((exp(0.3*x)-1)/3);

% Superposition des deux courbes pour trouver les intersections
plot(x,y1,x,y2)

% Recherche des indices pour lesquels on a pratiquement intersection
indices=find(abs(y1-y2)<0.005);

% Calcul des coordonnées correspondantes aux indices
a=x(indices);
b=y1(indices);

% Affichage sur le graphe
hold on
text(a(1),b(1),'\leftarrow première solution',...
     'HorizontalAlignment','left')
text(a(2),b(2),'seconde solution \rightarrow',...
     'HorizontalAlignment','right')
