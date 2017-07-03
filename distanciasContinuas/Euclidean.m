function d=Euclidean(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (abs(vec1(i)-vec2(i)))^2;
	end
	d=sqrt(suma);
else
	error('Euclidean:DifTam','Vectores deben de ser del mismo tamaño.');
end