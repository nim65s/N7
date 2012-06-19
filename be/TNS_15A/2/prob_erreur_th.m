function [ e ] = prob_erreur_th( N , s )
    e = normcdf(-1/(2*s),0,s);
end

