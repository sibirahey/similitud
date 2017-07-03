function d=Tanimoto(vec1,vec2)
sumaP=0;
sumaQ=0;
sumaMin=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		sumaP = sumaP + vec1(i);
		sumaQ = sumaQ + vec2(i);
		sumaMin = sumaMin + min(vec1(i),vec2(i));
	end
	d=(sumaP+sumaQ-2*sumaMin)/(sumaP+sumaQ-sumaMin);
else
	error('Tanimoto:DifTam','Vectores deben de ser del mismo tamaño.');
end