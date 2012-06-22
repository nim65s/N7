function [ Zout ] = Z( M )
A = M(1,1);
B = M(1,2);
C = M(2,1);
D = M(2,1);
Z11 = A/C;
Z12 = (A*D-B*C)/C;
Z21 = 1/C;
Z22 = D/C;

Zout = [Z11,Z12;Z21,Z22];

end

