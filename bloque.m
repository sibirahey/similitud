function arr = bloque( sec,cant,tamBloque )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    arr = ones(cant,1);
    inferior = 1;
    div = cant / tamBloque;
    superior = tamBloque;
    indexSec = 1;
    for i = 1:div
        if indexSec > length(sec) 
            indexSec = 1;
        end
        val = sec(indexSec);
        arr(inferior:superior) = val;
        inferior = inferior + tamBloque;
        superior = superior + tamBloque;
        indexSec = indexSec + 1;
    end
end

