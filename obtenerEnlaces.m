function [ enlaces ] = obtenerEnlaces( nombres,resultados,m )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    %enlaces = zeros(length(nombres),1);
    for i=1 : length(nombres)
%         disp(i);
        r = resultados(:,i);
%         diag = matrizDiagonal(resultados(:,i),m);
        D = squareform(r);
        enlace = linkage(D,'average');
%         leafOrder = optimalleaforder(enlace,D);
        enlaces(i).enlace = enlace;
%         enlaces(i).leafOrder = leafOrder;
    end

end

