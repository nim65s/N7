function [ yeurk4 ] = RK4( f,x,y,h )
%RK2 

k1 = h.*feval(f,x,y);
k2 = h.*feval(f,x+h./2,y+k1./2);
k3 = h.*feval(f,x+h./2,y+k2./2);
k4 = h.*feval(f,x+h./2,y+k3);

yeurk4=y+(k1 + 2.*k2 + 2.*k3 + k4)./6;
end
