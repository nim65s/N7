function [ yeul,yeurk2,yeurk4 ] = trois_methodes( f,x,y,h )
%TROIS_METHODES retourne Y_(n+1) suivant les trois méthodes précédentes

k1 = h.*feval(f,x,y);
k2 = h.*feval(f,x+h./2,y+k1./2);
k3 = h.*feval(f,x+h./2,y+k2./2);
k4 = h.*feval(f,x+h./2,y+k3);

yeul   = y + k1;
yeurk2 = y + (k1 + 2.*k2)./3;
yeurk4 = y + (k1 + 2.*k2 + 2.*k3 + k4)./6;

end