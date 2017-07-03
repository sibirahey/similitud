function d=Chebyshev(vec1,vec2)
suma=0;
if(length(vec1) == length(vec2))
	d=max(vec1-vec2);
else
	error('Chebyshev:DifTam','Vectores deben de ser del mismo tamaño.');
end