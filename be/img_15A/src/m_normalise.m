function [ m ] = m_normalise( M, Zc )
A = M(1,1);
B = M(1,2);
C = M(2,1);
D = M(2,1);
Yc=1/Zc;
a = A;
b = B/Zc;
c = C/Yc;
d = D;

m = [a,b;c,d];
end

