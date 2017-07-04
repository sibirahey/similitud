function d=MeanAbsoluteError(a,p)

    if(length(p) == length(a))
        d = sum(abs(p-a))/length(a);
    else
        error('MeanAbsoluteError:DifTam','Vectores deben de ser del mismo tamaño.');
    end