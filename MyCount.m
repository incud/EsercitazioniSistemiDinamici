function n = MyCount(v, element)
    n = 0;
    for index = 1:numel(v)
        if isequaln( v(index), element ) 
            n = n + 1;
        end
    end
end