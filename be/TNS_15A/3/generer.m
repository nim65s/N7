function [ Y ] = generer( teta,signal,sigma,N,K )

bruit = normmult(zeros(N,1),sigma,K); 
Y = kron(ones(K,1),teta*signal) +bruit;

end

