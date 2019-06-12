function n = CalculateAlgebricMolteplicity(lambda, A)

    % lista degli autovalori distinti
    eigenvalues = eig(A);
    uniqueEigenvalues = unique(eigenvalues);

    % calcolo il vettore degli elementi uguali
    bitEqual = logical(eigenvalues(:) == lambda);
    n = sum(bitEqual);
    
    fprintf('Calcolata molteplicità algebrica %d', n);
end