%% Crea una catena di Jordan di ordine 'order' 
%% tale che ci siano sia le parti reali che immaginarie della catena
function matrix = CreateRealJordanChain(M, order, T)

    col = FindIndependentGeneralizedEigenvector(M, order, T);
    
    % *** Creo la catena di Jordan *** 
    if isreal(col)
        % procedo come al solito
        matrix = [ col ];
        for k = (order - 1):-1:1
            col = (M * col);
            matrix = [ col matrix ];
        end
        
    else
        % divido in parte reale ed immaginaria
        matrix = [ real(col) imag(col) ];
        for k = (order - 1):-1:1
            col = (M * col);
            matrix = [ real(col) imag(col) matrix ];
        end
        
    end

end