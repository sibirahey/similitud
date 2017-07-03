function principal_parcial(nombres)
art = artificiales();%generacionDatosPrueba();
ale = aleatorios();
mat = [art ale];
%graficarMat(mat);
%combinatoria de las columnas de mat
[n,m] = size(mat);
combinaciones = combnk(1:m,2);
%nombres de distancias
%nombres = nombres();%todos los nombres disponibles
%nombres = {'Euclidean','Canberra','Tanimoto','Cosine','Bhattacharyya','AdditiveSymmetric','jd'};
% se inicializan los resultados
resultados = zeros(length(combinaciones),length(nombres));

for i = 1 : length(combinaciones)
	dis = distancias(mat(:,combinaciones(i,1)),mat(:,combinaciones(i,2)),nombres);
    resultados(i,:) = round2(dis',1e-2);		
end
%crear table
row_names =cellstr(strcat(num2str(combinaciones(:,1)),'-',num2str(combinaciones(:,2))));
T = array2table( resultados, 'VariableNames', nombres,'RowNames',row_names);
disp(T);

%guardar archivo
% dt = datestr(now,'yyyyddmmHHMMSS');
% nombreArchivo = strcat('prueba',dt,'.csv');
% writetable(T,nombreArchivo);

[R,P] = corrcoef(resultados);
%[R,P] = corrplot(resultados,'varNames',nombres,'testR','on');
Rtable = array2table( R, 'VariableNames', nombres,'RowNames',nombres) ;
disp(Rtable);
Ptable = array2table( P, 'VariableNames', nombres,'RowNames',nombres) ;
disp(Ptable);

 enlace = linkage(R,'single');
 figure;
 dendrogram(enlace,0,'Labels',nombres,'Orientation','right','ColorThreshold',max(enlace(:,3)));


