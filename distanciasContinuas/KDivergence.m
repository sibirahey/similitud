function d=KDivergence(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (vec1(i)*log(2*vec1(i)/(vec1(i)+vec2(i))));
	end
	d=suma;
else
	error('KDivergence:DifTam','Vectores deben de ser del mismo tama�o.');
end