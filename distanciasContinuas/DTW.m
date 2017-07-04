function [Distancia,DTW,M] = DTW(Q,C)

% Q es la primera serie de datos
% C es la segunda serie de datos
% Distancia es el valor de distancia que existe entre las dos series de
% datos
% DTW es la matriz de distancia utilizando la lógica de cómo trabaja
% Dynamic Time Warping
% M es la matriz de sólo distancia (por ejemplo Euclideana) entre las dos
% series de datos.
%SE RECOMIENDA PRIMERO VER LA PRESENTACION QUE SE ANEXA EN EL ARCHIVO
%******Creación de la Matriz de Costo************%


M=zeros(length(Q),length(C));

%Construcción de la Matriz de Costo%

for i=1:length(C)
	for j=1:length(Q)
		%M(i,j)=sqrt(((Q(i)-C(j))^2)); //Aqui se utiliza distancia
		%Euclideana
        M(i,j)=(Q(i)-C(j))^2;
	end
end

%*********Creación de la Matriz Acumulada DTW*************%
DTW=zeros(length(Q),length(C));
DTW(1,1)=M(1,1);

%Llenado de la primera fila%
for i=2:length(C)
      DTW(i,1)=DTW(i-1,1)+M(i,1);
end

%Llenado de la primera columna%
for j=2:length(Q)
      DTW(1,j)=DTW(1,j-1)+M(1,j);
end    

%Resto de la matriz
for i=2:length(Q)
	for j=2:length(C)
      		min=Minimum(DTW(i-1,j),DTW(i,j-1),DTW(i-1,j-1));
            DTW(i,j)=M(i,j)+ min;
	end
end    

Distancia = DTW (length(Q),length(C));