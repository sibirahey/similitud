function rango( diagonal ,nombres)

    maximo = min(diagonal(diagonal>0));
    %maximo = max(diagonal(diagonal>0));
    [x,y] = find(diagonal == maximo);
    nombres(x)
    nombres(y)
    
end

