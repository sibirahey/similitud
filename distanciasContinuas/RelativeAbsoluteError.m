function d=RelativeAbsoluteError(a,p)

    if(length(p) == length(a))
        a1 = sum(a)/length(a);
        d = sum(abs(p-a))/sum(abs(a-a1));
    else
        error('RelativeAbsoluteError:DifTam','Vectores deben de ser del mismo tamaño.');
    end