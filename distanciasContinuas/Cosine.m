function d=Cosine(vec1,vec2)
suma=0;
sumaP=0;
sumaQ=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (vec1(i)*vec2(i));
		sumaP = sumaP + (vec1(i)^2);
		sumaQ = sumaQ + (vec2(i)^2);

	end
	d=suma/(sqrt(sumaP)*sqrt(sumaQ));
else
	error('Cosine:DifTam','Vectores deben de ser del mismo tamaño.');
end