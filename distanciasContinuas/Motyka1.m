function d=Motyka1(vec1,vec2)
suma=0;
suma1=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + max(vec1(i),vec2(i));
		suma1 = suma1 + (vec1(i)+vec2(i));
	end
	d=suma/suma1;
else
	error('Motyka1:DifTam','Vectores deben de ser del mismo tama�o.');
end