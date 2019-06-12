%% Ritorna esito = 1 se A raggiungibile,
%%         R matrice di raggiungibilità
%%         T matrice di cambio base
function [esito,R,T] = Raggiungibilita(A,B)

    A = sym(A);
    B = sym(B);

    %% controllo della dimensione
    [ar n] = size(A);
    if ar ~= n
        error('La matrice in input deve essere quadrata');
    end
    
    %% calcolo matrice raggiungibilità
    R = [];
    for i = 0:n-1
        R = [R, (A^i)*B];
    end
    
    %% calcolo raggiungibilità
    if rank(R) == n
        esito = 1;
    else
        esito = 0;
    end
        
    %% calcolo matrice di trasformazione
    V = R(:, VectorSpace.Span(R));
    VI = FindIndependentColumns(eye(n), V);
    T = [V, VI];

end