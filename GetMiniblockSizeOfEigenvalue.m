function miniblockSize = GetMiniblockSizeOfEigenvalue(lambda, A)

    % prendo la dimensione della matrice
    [ar ac] = size(A);
    n = ac;

    % calcolo la molteplicità algebrica e geometrica
    ma = CountSymItemInVector(lambda, eig(A));
    mg = n - rank(A - lambda * eye(n)); % per nullità più rango, ker(A-lambda I) ha dimensione n - rank(A - lambda I)

    % tabella dimensione dei miniblocchi
    miniblockSize = zeros(1, mg);
    
    % creo l'array delle differenze tra dimensioni, e la tabella delle 'x'
    difference = zeros(1, ma);
    xtable = zeros(mg, ma);
    
    fprintf('\n*** Autovalore lambda_i = %d (ma=%d, mg=%d) ***\n', lambda, ma, mg);

    if mg > 1
    
        % popolo l'array delle differenze: prima metto tutte le dimensioni, poi sottraggo all'indietro
        for i = 1:ma
            difference(i) = n - rank((A - lambda * eye(n))^i);
        end
        for i = ma:-1:2
            difference(i) = difference(i) - difference(i-1);
        end

        % popolo la tabella delle crocettine
        for i = 1:ma
            for j = 1:difference(i)
                xtable(j, i) = 1;
            end
        end

        % popolo la tabella delle dimensioni dei miniblocchi
        for i = 1:mg
            miniblockSize(i) = sum(xtable(i,:));
        end
        
        fprintf('Differenze tra sottospazi:\n');
        disp(difference);
        fprintf('Tabella delle dimensioni:\n');
        disp(xtable);
        
    else
        miniblockSize = [ ma ];
    end
    
    fprintf('Dimensioni dei miniblocchi:\n');
    disp(miniblockSize);
    
end