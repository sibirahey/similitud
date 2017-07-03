function arr = bloqueAleatorio( fijo,cant,tamBloque )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    arr = ones(cant,1);
    inferior = 1;
    div = cant / tamBloque;
    superior = tamBloque;
    bandera = true;
    for i = 1:div
        if bandera 
            arr(inferior:superior) = randi(10,tamBloque,1);
            bandera = false;
        else
            arr(inferior:superior) = fijo;
            bandera = true;
        end
        inferior = inferior + tamBloque;
        superior = superior + tamBloque;
    end
end

