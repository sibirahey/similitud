function d=Hellinger(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + ( sqrt(vec1(i)) - sqrt(vec2(i)) )^2;
	end
	d= sqrt(2*suma);
else
	error('Hellinger:DifTam','Vectores deben de ser del mismo tamaño.');
end