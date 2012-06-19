function [ e ] = prob_erreur_est( N , s )
b = s*randn(N,1);
x = rand(N,1) < 0.5;
z = x + b;
e = (length(find(z<0.5 & x == 1))+length(find(z>0.5 & x == 0)))/N;
end

