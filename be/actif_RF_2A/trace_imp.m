function trace_centre(z,couleur)
%fin du trac� de l'abaque

 %Trac� de l'imp�dance Z
 R=(z-1)/(z+1);
 plot(real(R),imag(R),[couleur]);
 
 
 