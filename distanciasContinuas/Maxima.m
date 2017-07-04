function d=Maxima(a,p)

    if(length(p) == length(a))
        d = max(length(p), length(a)) * Euclidean(max([p a]),min([p a]));
    else
        error('Maxima:DifTam','Vectores deben de ser del mismo tamaño.');
    end