function d=SimFDTW(a,p)

    if(length(p) == length(a))
        maxi = Maxima(a,p);
        dtw = DTW(a,p);
        d = (maxi - dtw )/ maxi;
    else
        error('SimFDTW:DifTam','Vectores deben de ser del mismo tamaño.');
    end