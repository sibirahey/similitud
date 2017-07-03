function nombres = obtenerNombres( tipo )
%obtenerNombres se obtienen los nombres de las distancias
    
    if tipo == 'continua'
        [~,txt] = xlsread('distanciasContinuas.xlsx');
        nombres = txt';
    elseif tipo == 'discreta'
        [~,txt] = xlsread('distanciasDiscretas.xlsx');
        nombres = txt';
    end

end

