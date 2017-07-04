function d=RelativeSquaredError(a,p)

    if(length(p) == length(a))
        a1 = sum(a)/length(a);
        d = sum((p-a).^2)/sum((a-a1).^2);
    else
        error('RelativeSquaredError:DifTam','Vectores deben de ser del mismo tamaño.');
    end