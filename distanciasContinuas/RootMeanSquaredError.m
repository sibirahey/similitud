function d=RootMeanSquaredError(a,p)

    if(length(p) == length(a))
        d = sqrt(sum((p-a).^2)/length(a));
    else
        error('RootMeanSquaredError:DifTam','Vectores deben de ser del mismo tamaño.');
    end