%clear;clc;

N = 3;
g = numgrid('Ne2',N+2);
spy(g);

A=delsq(g);
full(A);

b = eye(size(A,1));

[XV,LMB,IRESULT] = SPTARN(A,b,0,100);
u=XV(:,1);
U=g;
U(g>0)=full(u(g(g>0)));
mesh(U);

LMB
