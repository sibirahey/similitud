function [ T ] = tablaResultados( resultados, combinaciones, nombres)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    row_names =cellstr(strcat(num2str(combinaciones(:,1)),'-',num2str(combinaciones(:,2))));
    T = array2table( resultados, 'VariableNames', nombres,'RowNames',row_names);
    %disp(T);

end

