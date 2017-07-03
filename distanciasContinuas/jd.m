function d=jd(vec1,vec2)
if(length(vec1) == length(vec2))
    uno = vec1 .* log(vec1);
    dos = vec2 .* log(vec2);
    tres = (vec1+vec2)/2;
    d = sum(((uno+dos)/2)-(tres .* log(tres)));
else
	error('jd:DifTam','Vectores deben de ser del mismo tamaño.');
end