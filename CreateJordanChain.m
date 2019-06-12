%% Crea una catena di Jordan di ordine 'order' (quindi una matrice con 'order' colonne)
%% i quali vettori colonna sono indipendenti da quelli in T
function matrix = CreateJordanChain(M, order, T)

    col = FindIndependentGeneralizedEigenvector(M, order, T);
    
    % *** Creo la catena di Jordan *** 
    matrix = [ col ];
    for k = (order - 1):-1:1
        col = (M * col);
        matrix = [ col matrix ];
    end

end