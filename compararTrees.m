function [diagonal,diagonalT] = compararTrees(enlaces,nombres,guardar,archivoStrings,h,folderName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    for i = 1 :length(enlaces)
        arbol = enlaces(i).enlace;
        mat(i).tree = tree(arbol);
        mat(i).en = arbol;
%         mat(i).leafOrder = enlaces(i).leafOrder;
    end

    combinaciones = combnk(1:length(enlaces),2);
    if length(enlaces) < 6
        combinaciones = flipud(combinaciones);
    end

    


    [n,~] = size(combinaciones);
    distancias = zeros(1,n);
    for i = 1 : n
        waitbar(i/n,h,'Comparando Dendrogramas');
        f = figure('visible','off');
        uno = combinaciones(i,1);
        dos = combinaciones(i,2);
        d = treeToTreeD(mat(uno).tree,mat(dos).tree);
        distancias(i) = d;
        %disp([combinaciones(i,:) d]);
        %se guardan las imagenes de los dendrogramas en un archivo
        if guardar
            cd(folderName);
            addLine(i,f,uno,dos,mat,d,nombres);
            cd '..';
        end
    end
    
    %se obtiene la matriz triangular de resultados entre arboles
    [diagonal,diagonalT] = matrizDiagonal(distancias,length(enlaces),nombres);
    %disp(diagT);
%     h = figure;%('visible','off');
%     u = uitable(h,'Data',diag,'RowName',nombres,'ColumnName',nombres,'Position',[20 20 262 204]);
%     
%     table_extent = get(u,'Extent');
%     set(u,'Position',[1 1 table_extent(3) table_extent(4)])
%     figure_size = get(h,'outerposition');
%     desired_fig_size = [figure_size(1) figure_size(2) table_extent(3) table_extent(4)+80];
%     set(h,'outerposition', desired_fig_size);
    
    cd(folderName);
    %guardar archivo
    nombreArchivo = strcat('resultados','.xlsx');
    writetable(diagonalT,nombreArchivo,'WriteRowNames',true);
%     disp(diagT);
    cd '..';
    
end


function addLine(i,f,uno,dos,mat,d,nombres)
    p = uipanel('Parent',f,'BorderType','none'); 
    p.Title = strcat('D=',num2str(d)); 
    p.TitlePosition = 'centertop'; 
    p.FontSize = 12;
    p.FontWeight = 'bold';

    subplot(2,1,1,'Parent',p);
    H = dendrogram(mat(uno).en,0);%,'Reorder',mat(uno).leafOrder);
    set(H,'LineWidth',1.5);
    title(nombres{uno})
    subplot(2,1,2,'Parent',p);
    H = dendrogram(mat(dos).en,0);%,'Reorder',mat(dos).leafOrder);
    set(H,'LineWidth',1.5);
    title(nombres{dos})
    
    saveas(f,strcat(num2str(i),'_',num2str(uno),nombres{uno},'_',num2str(dos),nombres{dos},'_',num2str(d)),'png');
end





