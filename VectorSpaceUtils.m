
classdef VectorSpace

    methods (Static)
    
        % ritorna gli indici della matrice M corrisponenti a colonne linearmente indpendenti tra loro
        function pivots = Span(M)
            % applico l'eliminazione di Gauss
            gauss = double(rref(M));
            % trovo i pivot
            pivots = find( sum(gauss ~= 0) == 1)
        end
    
    end

end