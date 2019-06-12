%% Ritorna 1 se il vettore colonna v è indipendente dalle colonne della matrice M 
%% Ritorna 0 se il vettore è dipendente
function esito = IsVectorIndependent(v, M)

    % controllo delle dimensioni
    [mr mc] = size(M);
    [vr vc] = size(v);
    % v deve essere un vettore colonna
    if vc ~= 1
        error(sprintf('IsVectorIndependent: il vettore v deve essere una colonna Rx1 invece è %dx%d', vr, vc));
    end
    % le dimensioni di vettore e matrice devono corrispondere
    if vr ~= mr
        error(sprintf('IsVectorIndependent: il vettore v ha %d righe mentre la matrice ne ha %d', vr, mr));
    end
    % se il rango della matrice è massimo, serve a poco aggiungere vettori
    if rank(M) == mr
        warning('IsVectorIndependent: Il rango della matrice è già massimo, ogni vettore risulta non linearmente indipendente');
    end

    esito = false;
    % il vettore è linearmente indipendente se aggiungendolo alla matrice allora ho un nuovo pivot
    if rank([M v]) > rank(M)
        esito = true;
    end
end