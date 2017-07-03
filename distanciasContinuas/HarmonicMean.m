function d=HarmonicMean(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + ((vec1(i)*vec2(i))/(vec1(i)+vec2(i)));
	end
	d=2*suma;
else
	error('HarmonicMean:DifTam','Vectores deben de ser del mismo tamaño.');
end