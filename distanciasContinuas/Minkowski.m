function d=Minkowski(vec1,vec2,p)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (abs(vec1(i)-vec2(i)))^p;
	end
	d=nthroot(suma,p);
else
	error('Minkowski:DifTam','Vectores deben de ser del mismo tamaño.');
end