np = size(p,2);
[Q,u1,H,u2] = assemb(b,p,e);
N = size(Q,2)/np;
[A,B,u3] = assema(p,t,1,0,zeros(N,1));
[u,B] = assema(p,t,0,1,zeros(N,1));
[u0,u1,M,u2] = assempde(A,B,u3,Q,u1,H,u2);

Af=zeros(size(p,2));
Bf=zeros(size(p,2));


for k = 1:size(t,2)
    x1 = p(1,t(1,k));   y1 = p(2,t(1,k));
    x2 = p(1,t(2,k));   y2 = p(2,t(2,k));
    x3 = p(1,t(3,k));   y3 = p(2,t(3,k));
    x12 = x1-x2;        y12 = y1-y2;
    x23 = x2-x3;        y23 = y2-y3;
    x13 = x1-x3;        y13 = y1-y3;


    Ay = ((x2-x1)*(y3-y1)-(y2-y1)*(x3-x1))/2;

    Be = ones(3) + eye(3);
    Be = Ay/12*Be;

    Ae = zeros(3);

    Ae(1,2) = -x13*x23-y23*y13;
    Ae(1,3) =  y23*y12+x23*x12;
    Ae(2,3) = -y13*y12-x13*x12;
    Ae = Ae + Ae'+diag([y23^2+x23^2 y13^2+x13^2 y12^2+x12^2]);
    Ae = 0.25/Ay*Ae;
    
    for i=1:3
        for j = 1:3
            il = t(i,k);
            jl = t(j,k);
            Af(il,jl) = Af(il,jl)+Ae(i,j);
            Bf(il,jl) = Bf(il,jl)+Be(i,j);
        end
    end
end

size(A)
A = M'*A*M;
B = M'*B*M;
Af = M'*Af*M;
Bf = M'*Bf*M;

% A == Af & B == Bf

[v,l,ires] = sptarn(A,B,0,30);
