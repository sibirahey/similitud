function d=Matusita1(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma +  sqrt(vec1(i)*(vec2(i)));
	end
	d=sqrt(2-2*suma);
else
	error('Matusita1:DifTam','Vectores deben de ser del mismo tamaño.');
end