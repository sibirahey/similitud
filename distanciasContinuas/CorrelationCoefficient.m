function d=CorrelationCoefficient(a,p)

    if(length(p) == length(a))
        a1 = sum(a)/length(a);
        sa = sum((a-a1).^2)/(length(a)-1);
        
        p1 = sum(p)/length(p);
        sp = sum((p-p1).^2)/(length(p)-1);
        
        spa = sum((p-p1).*(a-a1))/(length(p)-1);
        
        d = spa/sqrt(sp*sa);
    else
        error('CorrelationCoefficient:DifTam','Vectores deben de ser del mismo tamaño.');
    end