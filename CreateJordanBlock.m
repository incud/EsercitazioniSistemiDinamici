function block = CreateJordanBlock(lambda, order)
    order = double(order); % se simbolico riporto alla versione numerica
    block = zeros(order);
    for i = 1:order
        % setto la diagonale
        block(i,i) = lambda;
        % setto la sovradiagonale
        if i < order
            block(i, i+1) = 1;
        end
    end
end