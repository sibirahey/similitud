function d=SSquaredChord(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma +  (sqrt(vec1(i)*(vec2(i)))-1);
	end
	d=(2*suma);
else
	error('SSquaredChord:DifTam','Vectores deben de ser del mismo tamaño.');
end