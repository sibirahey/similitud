function d=SquaredEuclidean(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (vec1(i)-vec2(i))^2;
	end
	d=suma;
else
	error('SquaredEuclidean:DifTam','Vectores deben de ser del mismo tamaño.');
end