% function mat = stringsArtificiales()

% mitad mitad - diferencia de 1
    a1 = [ones(250,1) ;ones(250,1)*2];
    a2 = [ones(250,1)*2 ;ones(250,1)];
    a3 = [ones(250,1)*9 ;ones(250,1)*8];
    a4 = [ones(250,1)*8 ;ones(250,1)*9];
    
% mitad mitad - diferencia de 3
    a5 = [ones(250,1) ;ones(250,1)*4];
    a6 = [ones(250,1)*4 ;ones(250,1)];
    a7 = [ones(250,1)*6 ;ones(250,1)*9];
    a8 = [ones(250,1)*9 ;ones(250,1)*6];

%alternados - diferencia de 8
    a9 = ones(1,500)';
    a9(2:2:end) = a9(2:2:end)*9;
    a10 = ones(1,500)';
    a10(1:2:end) = a10(1:2:end)*9;
    
%bloques de 20 diferencia de 8
    a11 = bloque([1,9],500,20);
    a12 = bloque([9,1],500,20);
    
%bloques de 20 diferencia de 1
    a13 = bloque([1,2],500,20);
    a14 = bloque([2,1],500,20);
    a15 = bloque([8,9],500,20);
    a16 = bloque([9,8],500,20);

%bloques de 20 diferencia de 3
    a17 = bloque([1,3],500,20);
    a18 = bloque([3,1],500,20);
    a19 = bloque([6,9],500,20);
    a20 = bloque([9,6],500,20);
    
%%%%%%   ALEATORIOS Y FIJOS
    
% mitad fijo mitad rand
    a21 = [ones(250,1) ;randi(10,250,1)];
    a22 = [randi(10,250,1) ;ones(250,1)];
    a23 = [ones(250,1)*9 ;randi(10,250,1)];
    a24 = [randi(10,250,1) ;ones(250,1)*9];
    
% mitad mitad - diferencia de 3 con rand en medio
    a25 = [ones(167,1); randi(10,166,1) ;ones(167,1)*4];
    a26 = [ones(167,1)*4; randi(10,166,1) ;ones(167,1)];
    a27 = [ones(167,1)*6; randi(10,166,1) ;ones(167,1)*9];
    a28 = [ones(167,1)*9; randi(10,166,1) ;ones(167,1)*6];

%alternados - con rand en medio
    a29 = ones(1,500);
    a29(2:2:end) = randi(10,250,1);
    a29 = a29';
    a30 = ones(1,500);
    a30(1:2:end) = randi(10,250,1);
    a30 = a30';
    
%bloques de 20 con rand
    a31 = bloqueAleatorio(1,500,20);
    a32 = bloqueAleatorio(9,500,20);
    

%dos terceras partes aleatorias
    a33 = [ones(167,1) ; randi(10,333,1)];
    a34 = [randi(10,333,1) ; ones(167,1)];
    a35 = [ones(167,1) * 9 ; randi(10,333,1)];
    a36 = [randi(10,333,1) ; ones(167,1) * 9];

%tercera parte aleatoria
    a37 = [ones(333,1) ; randi(10,167,1)];
    a38 = [randi(10,167,1) ; ones(333,1)];
    a39 = [ones(333,1) * 9 ; randi(10,167,1)];
    a40 = [randi(10,167,1) ; ones(333,1) * 9];
    
    %randi(10,4,1)

    

    mat = [a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40];
    T = array2table(mat);
    writetable(T,'stringsContinuosArtificiales.xlsx');
%     disp(T);
% end



