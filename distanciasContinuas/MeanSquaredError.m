function d=MeanSquaredError(a,p)

    if(length(p) == length(a))
        d = sum((p-a).^2)/length(a);
    else
        error('MeanSquaredError:DifTam','Vectores deben de ser del mismo tamaño.');
    end