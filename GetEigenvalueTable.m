function etable = GetEigenvalueTable(A)
    eigenvalues = double(eig(A));
    [m, n] = size(A);
    id = eye(n);

    Eigenvalues = unique(eigenvalues);
    AlgebricMolteplicity = arrayfun ( @(x) MyCount(eigenvalues, x), Eigenvalues);
    GeometricMolteplicity = arrayfun ( @(x) size(null(A - x*id), 2), Eigenvalues);

    etable = table(Eigenvalues, AlgebricMolteplicity, GeometricMolteplicity);
end