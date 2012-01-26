function [ yeurk2 ] = RK2( f,x,y,h )
%RK2 

k1 = h.*feval(f,x,y);
k2 = h.*feval(f,x+h./2,y+k1./2);

yeurk2=y+(k1 + 2.*k2)./3;
end

