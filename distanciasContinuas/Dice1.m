function d=Dice1(vec1,vec2)
suma=0;
sumaP=0;
sumaQ=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (vec1(i)-vec2(i))^2;
		sumaP = sumaP + (vec1(i)^2);
		sumaQ = sumaQ + (vec2(i)^2);
	end
	d=2*suma/(sumaP+sumaQ);
else
	error('Dice1:DifTam','Vectores deben de ser del mismo tamaño.');
end