function exp = calcular( salvar,tipo,archivoStrings,nombres,carpeta )
%CALCULAR 
%  Parametros de entrada: 
%   - salvar (tue o false) salva los dendrogramas como imagenes;
%   - tipo (discreta o continua)
%   - excel con los strings
%   - nombre de las tecnicas, si no es escificado ejecuta todas las
%   tecnicas
    pasos = 4;
    fprintf('Iniciando %s...\n',archivoStrings);
    h = waitbar(0,'Iniciando...');
    mat = obtenerStrings(archivoStrings);
    
    
    dt = datestr(now,'yyyyddmmHHMMSS');
    folderName = strcat(dt,'_',carpeta);
    mkdir(folderName);
    
    [n,m] = size(mat);
    combinaciones = hacerCombinaciones(mat);

    % se inicializan los resultados
    resultados = zeros(length(combinaciones),length(nombres));
    fprintf('    Calculando distancias(%d strings,%d tecnicas,%d combinaciones de strings)...\n',m,length(nombres),length(combinaciones));
    waitbar(1/pasos,h,'Calculando Distancias');
    for i = 1 : length(combinaciones)
        dis = distancias(tipo,mat(:,combinaciones(i,1)),mat(:,combinaciones(i,2)),nombres);
        resultados(i,:) = round2(dis',1e-2);		
    end
    
    
    fprintf('    ...Distancias calculadas\n    Obteniendo dendrogramas...\n');
    waitbar(2/pasos,h,'Obteniendo dendrogramas');
    enlaces = obtenerEnlaces(nombres,resultados,m);
    %guardarDendogramas(enlaces,nombres);
    T = tablaResultados( resultados, combinaciones, nombres);
    
    
    fprintf('    ...Dendrogramas obteniendos\n    Comparando Dendrogramas...Guardando Imagenes...\n');
    waitbar(3/pasos,h,'Comparando Dendrogramas');
    [diagonal,diagonalT] = compararTrees(enlaces,nombres,salvar,'exp',h,folderName);
    
    
    waitbar(4/pasos,h,'Guardando Experimento');
    exp.mat = mat;
    exp.combinaciones = combinaciones;
    exp.resultados = resultados;
    exp.enlaces = enlaces;
    exp.T = T;
    exp.diagonal = diagonal;
    exp.diagonalT = diagonalT;
    exp.nombres = nombres;
    
    cd(folderName);
    save(strcat('exp','.mat'),'exp');
    cd '..';
    
fprintf('...Fin %s\n',archivoStrings);
close(h);
end

