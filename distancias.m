function D = distancias(tipo,A, B,distancias)

[n1, k1]=size(A);
[n2, k2]=size(B);

    if(k1~=k2)
        disp('number of columns of A and B must be the same')
    else
        if tipo == 'continua'
            D = continuas(A, B,distancias);
        elseif tipo == 'discreta'
            D = discretas(A, B,distancias);
        end

    end
end

function D = continuas(A, B,distancias)
    cd distanciasContinuas
    pA= [A(:)]';
	pB= [B(:)]';	
    D = [];
    for i = 1 : length(distancias)
        dis = distancias{i};
        fhandle = str2func(dis);
        resultado = fhandle(pA,pB);
        D = [D; resultado];
    end
	cd ..
end

function D = discretas(A, B,distancias)
    cd distanciasDiscretas
    D = distanciasDiscretas(A, B,distancias);
	cd ..
end