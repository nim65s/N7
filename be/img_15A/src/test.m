function [ M ] = test( Zc,vp,d,f )
g = 1i*2*pi*f/vp;
Yc = 1/Zc;

A = cosh(g*d);
B = Zc*sinh(g*d);
C = Yc*sinh(g*d);
D = cosh(g*d);
M = [A,B;C,D]

end

