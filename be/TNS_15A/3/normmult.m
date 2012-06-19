function Y = normmult( m , sigma, n )
    A = chol(sigma)';
    for i = 1:n  
        X = randn(size(m));
        Y(i,:) = A*X + m;
    end
    
end

