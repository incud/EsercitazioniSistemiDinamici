function n = CountSymItemInVector(item, vector)

    % calcolo il vettore degli elementi uguali
    bitEqual = logical(vector(:) == item);
    n = sum(bitEqual);
    
end