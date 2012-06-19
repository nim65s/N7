function [ p ] = pi_theorique(signal,sigma,N)

alpha = 0.01:0.01:0.99; 
sigma_s = sqrt(signal'/sigma*signal)
beta = normcdf(-normcdf(alpha/2)+sigma_s)-normcdf(normcdf(alpha/2)+sigma_s); 
p = 1 - beta;

end


