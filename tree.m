function mat = tree( en )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [n,m] = size(en);
    tam = n + n + 1;
    mat = zeros(tam,5);
    mat(:,1) = 1:tam;
    mat(n+2:end,2:3) = en(:,1:2);

    %calculate N
    mat(1:n+1,4) = ones(n+1,1);
    for i = n+2 : tam
        mat(i,4) = calculateN(i,mat);
    end

    elemento = en(1);
    for i = 1 : tam
        mat(elemento,5) = i;
        elemento = siguiente(mat,elemento); 
    end

end

function sig = siguiente(mat,elemento)
    sig = 0;
    padre = find(mat(:,2) == elemento);
    if padre
        sig = siguienteHijo(mat,padre);
    else
        padre = find(mat(:,3) == elemento);
        if padre
            sig = siguienteHijo(mat,padre);
        end
    end
end

function sig = siguienteHijo(mat,padre)
    h1 = mat(padre,2);
    if tieneOrden(mat,h1)
        h2 = mat(padre,3);
        if tieneOrden(mat,h2)
            sig = padre;
        else
            sig = siguienteHijo(mat,h2);
        end
    else
        sig = siguienteHijo(mat,h1);
    end
end

function b = tieneOrden(mat,elemento)
    if elemento == 0
        b = true;
        return;
    end
    orden = mat(elemento,5);
    if orden == 0
        b = false;
    else
        b = true;
    end
end


function N = calculateN(indice,mat)
    h1 = mat(indice,2);
    h2 = mat(indice,3);
    N = mat(h1,4) + mat(h2,4) + 1;
end


