function d=Matusita(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + ( sqrt(vec1(i)) - sqrt(vec2(i)) )^2;
	end
	d= sqrt(suma);
else
	error('Matusita:DifTam','Vectores deben de ser del mismo tama�o.');
end