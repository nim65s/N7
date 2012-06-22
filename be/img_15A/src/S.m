function [ Sout ] = S( M, Zc )
A = M(1,1);
B = M(1,2);
C = M(2,1);
D = M(2,1);
S11 = (A+B/Zc-C*Zc-D)/(A+B/Zc+C*Zc+D);
S12 = 2*(A*D-B*C)/(A+B/Zc+C*Zc+D);
S21 = 2/(A+B/Zc+C*Zc+D);
S22 = (-A+B/Zc+C*Zc+D)/(A+B/Zc+C*Zc+D);

Sout = [S11,S12;S21,S22];


end

