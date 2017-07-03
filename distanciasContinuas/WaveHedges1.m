function d=WaveHedges1(vec1,vec2)
suma=0;
suma1=0;
if(length(vec1) == length(vec2))
	for i = 1 : length(vec1)
		suma = suma + (abs(vec1(i)-vec2(i))/max(vec1(i),vec2(i)));
	end
	d=suma;
else
	error('WaveHedges1S:DifTam','Vectores deben de ser del mismo tamaño.');
end