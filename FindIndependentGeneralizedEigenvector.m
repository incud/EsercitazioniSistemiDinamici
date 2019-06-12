function col = FindIndependentGeneralizedEigenvector(M, order, T)

    % colonna dell'autovettore con grado più alto. Lo assegno solo a fare da segnaposto
    col = [];
    
    % *** Qui sto cercando l'autovettore generalizzato di ordine k ***
    
    % trova ogni possibile autovettore generalizzato
    genEigenvectors = FindGeneralizedEigenvectors(M, order);
    % filtra gli autovettori perchè siano indipendenti da quelli in T (ammesso ce ne siano)
    genEigenvectors = FindIndependentColumns(genEigenvectors, T);

    % quante colonne ho? se 0 errore; se 1 spero non sia soli zeri; se > 1 ok ne prendo una a caso
    [gr gc] = size(genEigenvectors);
    if gc == 0
        error(sprintf('CreateJordanChain: la matrice non ha autovettori generalizzati di ordine %d', order));
    elseif gc == 1
        % Controllo che l'unico autovettore non sia tutti zero
        col = genEigenvectors(:,1);
        isOnlyZero = CountSymItemInVector(0, col) > 0;
        
        if isOnlyZero
            % Se l'unico vettore è formato da soli zeri allora cerco un vettore della base canonica che 
            % sia indipendente dai vettori in T
            [mr mc] = size(M);
            genEigenvectors = eye(mc);
            genEigenvectors = FindIndependentColumns(genEigenvectors, T);
            col = genEigenvectors(:,1);
        end
    else
        % Prendo un vettore a caso tra quelli calcolati, tanto so che non è mai soli zeri.
        col = genEigenvectors(:,1);
    end

end