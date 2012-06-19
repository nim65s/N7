function [ teta_est, BRC ] = estimateur_mv(Y,signal,sigma,K)

teta_est = (signal*(sigma\Y))./(signal*(sigma\signal'));
BRC=(eye(K)./(signal*(sigma\signal')));
end

