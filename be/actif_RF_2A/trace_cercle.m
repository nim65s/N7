function trace_cercle(centre,rayon,couleur)
%Construction de l'abaque de smith

hold on
%centre du cercle
 C=centre;
 rep_centre=plot(real(C),imag(C),'.');
 set(rep_centre,'Color',[couleur],'lineWidth',[5])

%trace le cercle
grain=100;
Teta=(-pi:pi/grain:pi);
cercle=plot(C+rayon*exp(j*Teta));
set(cercle,'Color',[couleur],'lineWidth',[2])

