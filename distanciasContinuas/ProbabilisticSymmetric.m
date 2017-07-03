function d=ProbabilisticSymmetric(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (((vec1(i)-vec2(i))^2)/(vec1(i)+vec2(i)));
	end
	d=2*suma;
else
	error('ProbabilisticSymmetric:DifTam','Vectores deben de ser del mismo tamaño.');
end