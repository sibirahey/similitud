%nombres = {'Euclidean','Canberra','Tanimoto','Cosine','Bhattacharyya','AdditiveSymmetric','jd'};
%nombres = {'jaccard','stiles','gower','ample','euclid','hamann','chord'};
%histogram(b,'Normalization','pdf')
clc;

clear;
calcular( false,'continua','stringsContinuos/aleatorios30.xlsx',obtenerNombres('continua'),'aleatorios30');

clear;
calcular( false,'continua','stringsContinuos/caoticos30.xlsx',obtenerNombres('continua'),'caoticos30');

clear;
calcular( false,'continua','stringsContinuos/artificiales30.xlsx',obtenerNombres('continua'),'artificiales30');


