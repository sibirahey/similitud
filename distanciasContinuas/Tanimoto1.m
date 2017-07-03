function d=Tanimoto1(vec1,vec2)
suma=0;
sumaMin=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (max(vec1(i),vec2(i))-min(vec1(i),vec2(i)));
		sumaMin = sumaMin + min(vec1(i),vec2(i));
	end
	d=suma/sumaMin;
else
	error('Tanimoto1:DifTam','Vectores deben de ser del mismo tamaño.');
end