a = [1 0 0 1 1;
     2 0 0 1 2;
     3 0 0 1 4;
     4 0 0 1 5;
     5 1 2 3 3;
     6 3 4 3 6;
     7 5 6 7 7
    ];

b = [1 0 0 1 1;
     2 0 0 1 2;
     3 0 0 1 4;
     4 0 0 1 6;
     5 1 2 3 3;
     6 5 3 5 5;
     7 4 6 7 7
    ];

mat1 =  [0 1 2  ;
         0 0 3  ;
         0 0 0  
        ];
    
mat2 =  [0 3 2  ;
         0 0 1  ;
         0 0 0  
        ];
clc
enlace1 = linkage(mat1,'average')
enlace2 = linkage(mat2,'average')

figure;
subplot(2,1,1);
dendrogram(enlace1);
subplot(2,1,2);
dendrogram(enlace2);

arbol1 = tree(enlace1)
arbol2 = tree(enlace2)
treeToTreeD(arbol1,arbol2)
treeToTreeD(arbol2,arbol1)