function block = CreateComplexJordanBlock(lambda, order)
    % la dimensione è doppia poichè questo blocco vale anche
    % per il complesso coniugato di lambda
    order = double(order * 2); 
    block = zeros(order);
    for i = 1:2:order

        % setto la diagonale
        block(i,     i)     = real(lambda);
        block(i,     i + 1) = imag(lambda);
        block(i + 1, i)     = -1 * imag(lambda);
        block(i + 1, i + 1) = real(lambda);

        % setto la sovradiagonale
        if i + 2 <= order
            block(i,i + 2) = 1;
            block(i,i + 3) = 0;
            block(i + 1,i + 2) = 0;
            block(i + 1,i + 3) = 1;
        end
    end
end