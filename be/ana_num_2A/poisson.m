function [ U, Uideal ] = poisson( N, dn, dp, Nd, Na, Vn, Vp, q )
    h = (dp+dn)/(N+1);

    x = (-dn+h):h:(dp-h);
    x = x';

    A = 2*eye(N);
    b = zeros(N,1);
    Uideal = zeros(N,1);
    for i = 1:N-1
        A(i+1,i) = -1;
        A(i,i+1) = -1;
        b(i) = -rho(i*h, dn, dp, Nd, Na, q)/1e-12;
        if i < N/2
            Uideal(i) = Vp+q*Na*(x(i)-dp).^2/(2*h);
        else
            Uideal(i) = Vn -q*Nd*(x(i)-dn).^2/(2*h);
        end
    end
    b(1) = b(1) - Vn/h^2;
    b(end) = -rho(N*h, dn, dp, Nd, Na, q)/1e-12 + Vp/h^2;

    A = -A/h^2;

    U = inv(A)*b;
end

function y = rho(x, dn, dp, Nd, Na, q)
    if x-dn < -dn
        y = 0;
    elseif x-dn < 0
        y = Nd*q;
    elseif x-dn < dp
        y = -Na*q;
    else
        y = 0;
    end
end

