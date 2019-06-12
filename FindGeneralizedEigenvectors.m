%% Ritorna una matrice le cui colonne sono autovettori generalizzati di M
function matrix = FindGeneralizedEigenvectors(M, order)
    if order == 1
        % warning('FindGeneralizedEigenvectors: stai cercando autovalori generalizzati di ordine 1, ritorno null(M)');
        matrix = null(M);
    else
        % gli autovettori generalizzati di ordine k sono i vettori che generano
        % il sottospazio nullo di M^k e che non appartengono al sottospazio nullo 
        % di M^(k-1)
        matrix = FindIndependentColumns(null(M^order), null(M^(order-1)));    
    end
end