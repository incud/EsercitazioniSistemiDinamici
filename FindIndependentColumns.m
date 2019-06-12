%% Ritorna una matrice le cui colonne sono le colonne di TargetMatrix
%% che risultano linearmente indipendenti dalle colonne di CompareMatrix
function matrix = FindIndependentColumns(TargetMatrix, CompareMatrix)
    matrix = [];
    [tr tc] = size(TargetMatrix);
    [cr cc] = size(CompareMatrix);
    
    % Se ci sono colonne nella matrice di confronto allora posso
    % confrontare qualcosa, altrimenti ritorno tutto
    if cc > 0
        for i = 1:tc
            TargetCol = TargetMatrix(:,i);
            if IsVectorIndependent(TargetCol, CompareMatrix)
                matrix = [matrix TargetCol];
            end
        end
    else
        matrix = TargetMatrix;
    end
end