function trace_centre(z,couleur)
%fin du tracé de l'abaque

 %Tracé de l'impédance Z
 R=(z-1)/(z+1);
 plot(real(R),imag(R),[couleur]);
 
 
 