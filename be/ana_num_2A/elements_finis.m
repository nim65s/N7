function [ U ] = elements_finis( N, dn, dp, Nd, Na, Vn, Vp, q )
    h = (dp+dn)/(N+1);

    x = (-dn+h):h:(dp-h);
    x = x';

    A = 2*eye(N);
    b = zeros(N,1);
    if mod(N,2)
        for i = 1:N-1
            A(i+1,i) = -1;
            A(i,i+1) = -1;
            b(i) = h * rho(i*h, dn, dp, Nd, Na, q)/1e-12;
            if i < N/2
                Uideal(i) = Vp+q*Na*(x(i)-dp).^2/(2*h);
            else
                Uideal(i) = Vn -q*Nd*(x(i)-dn).^2/(2*h);
            end
        end
        b((N+1)/2) = (q*h/2e-12)*(Nd-Na);
    else
        for i = 1:N-1
            A(i+1,i) = -1;
            A(i,i+1) = -1;
            b(i) = h * rho(i*h, dn, dp, Nd, Na, q)/1e-12;
            if i < N/2
                Uideal(i) = Vp+q*Na*(x(i)-dp).^2/(2*h);
            else
                Uideal(i) = Vn -q*Nd*(x(i)-dn).^2/(2*h);
            end
        end
        b(N/2+1) = (q*h/2e-12)*(Nd/4-3*Na/4-Na);
    end
    b(1) = q*Nd*h/1e-12 + Vn/h;
    b(end) = -q*Na*h/1e-12 + Vp/h;
    %b(end) = -rho(N*h, dn, dp, Nd, Na, q)/1e-12 + Vp/h^2;
    
    U = inv(A/h)*b;
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

