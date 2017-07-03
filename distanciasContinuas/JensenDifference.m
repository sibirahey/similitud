function d=JensenDifference(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma1 = ((vec1(i)*log(vec1(i)))+(vec2(i)*log(vec2(i))))/2;
        suma2 = ((vec1(i)+vec2(i))/2)*log((vec1(i)+vec2(i))/2);
        suma = suma + (suma1-suma2);
	end
	d=suma;
else
	error('KDivergence:DifTam','Vectores deben de ser del mismo tamaño.');
end