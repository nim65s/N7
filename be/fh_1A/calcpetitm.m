function [ a ] = a( vp,d,f )
g = j*2*pi*f/vp;

a = cosh(g*d);
end

function [ b ] = b( vp,d,f )
g = j*2*pi*f/vp;

a = sinh(g*d);
end