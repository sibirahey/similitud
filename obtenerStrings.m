function mat = obtenerStrings( filename )
%obtenerStrings Obtienes los strings de prueba
    
    %art = artificiales();art(:,1:5)
%     load('aleatorio');
%     load('caoticos');
%     mat = [ aleatorio caoticos];

    mat = xlsread(filename);

end

