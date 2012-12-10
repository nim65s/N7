function [Y L] = telegraphistes(f,lambda,N)

L = exprnd(lambda);
while sum(L) <= (N/f)
    L = [L exprnd(lambda)];
end

A = (rand() > 0.5)*2 -1;
Y = zeros(N,1);

for i = 1:N
    toto = A;
    Nb = 1;
    somme = 0;
    while (somme <= (i/f))
        somme = somme + L(Nb);
        Nb = Nb + 1;
    end
    
    Y(i) = (mod(Nb, 2)*2 - 1)*A;
end

end