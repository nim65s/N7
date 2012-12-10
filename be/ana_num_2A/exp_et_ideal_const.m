function [ U, Uideal ] = exp_et_ideal_const( N,k )
    h = 1/(N+1);

    x = h:h:(1-h);
    x = x';

    A = 2*eye(N);
    for i = 1:N-1
        A(i+1,i) = -1;
        A(i,i+1) = -1;
    end

    A = A/h^2;

    b = k*ones(size(x));

    U = inv(A)*b;
    Uideal = k/2*(x-x.^2);
end