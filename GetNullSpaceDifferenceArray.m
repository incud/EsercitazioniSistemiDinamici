function array = GetNullSpaceDifferenceArray(A, lambda)
    [m, n] = size(A);
    array = zeros(1, n);
    id = eye(n);
    
    % calcolo le dimensioni dei sottospazi
    for k = 1:n
        M = (A - lambda * id)^k;     
        array(k) = n - rank(M);
        fprintf('Dimensione di KER(A - (%d)I)^%d => n - rank = %d - %d = %d\n', lambda, k, n, rank(M), array(k));
        disp(M);
        fprintf('Base dello spazio nullo\n');
        disp(null(M));
    end
    
    % calcolo le differenze
    for k = n:-1:2
        array(k) = array(k) - array(k-1);
    end    
end