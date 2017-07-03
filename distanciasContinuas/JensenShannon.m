function d=JensenShannon(vec1,vec2)
suma1=0;
suma2=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma1 = suma1 + (vec1(i)*log(2*vec1(i)/(vec1(i)+vec2(i))));
        suma2 = suma2 + (vec2(i)*log(2*vec2(i)/(vec1(i)+vec2(i))));
	end
	d=(suma1 + suma2)/2;
else
	error('KDivergence:DifTam','Vectores deben de ser del mismo tamaño.');
end