function y = generer_telegraphiste(f, lambda, N)
    y = zeros(N)
    L = exprnd(lambda)
    while sum(L) < N/f
        L  = [y exprnd(lambda)]
    end
    A = (rand() > 0.5) * 2 - 1

end

function n = nombre_de_changements(i,L)
    n = 0
    somme = 0
    i = 0
    while somme < i
        i++
        somme += L(i)

