function d = treeToTreeD( A,B )

    m = length(A);
    n = length(B);

    q = 1;
    p = 1;

    D = zeros(m+1,n+1);

    for j = 2 : m + 1
        a = hmenos1(A,j-1);
        D(1,j) = nodes(A,a) * q;
    end

    for i = 2 : n + 1
        b = hmenos1(B,i-1);
        D(i,1) = nodes(B,b) * p;
    end

    %disp(D);
    for i = 2 : n + 1
        for j = 2 : m + 1
            a = hmenos1(A,j-1);
            b = hmenos1(B,i-1);
            E = 0;

            t = rankNode(A,a);
            for l = 2 : t + 1
                hijo = buscarHijo(A,a,l);
                E(1,l) = E(1, l - 1) + nodes(A,hijo) * q;
            end
            E(1,t+2) = E(1,t+1) + q;

            s = rankNode(B,b);
            for k = 2 : s + 1
                hijo = buscarHijo(B,b,k);
                E(k,1) = E(k - 1, 1) + nodes(B,hijo) * p;
            end
            E(s+2,1) = E(s+1,1) + p;

            %%%%%%%%%%%%%%%%%%%%%%%%%
            for k = 2 : s + 1
                for l = 2 : t + 1
                    hijoB = buscarHijo(B,b,k);
                    hijoA = buscarHijo(A,a,l);
                    u = h(B,hijoB);
                    v = h(A,hijoA);
                    uno = E(k-1,l) + nodes(B,hijoB) * p;
                    dos = E(k,l-1) + nodes(A,hijoA) * q;
                    tres = E(k-q,l-q) + D(u,v);
                    E(k,l) =  min([uno dos tres]);
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%
            for l = 2 : t + 1
                hijoA = buscarHijo(A,a,l);
                v = h(A,hijoA);
                uno = E(s+2,l-1) + nodes(A,hijoA) * q;
                dos = E(s+1,l) + p;
                tres = E(1,l-1) + D(i,v);
                E(s+2,l) =  min([uno dos tres]);
            end

            for k = 2 : s + 1
                hijoB = buscarHijo(B,b,k);
                u = h(B,hijoB);
                uno = E(k-1,t+2) + nodes(B,hijoB) * p;
                dos = E(k,t+1) + q;
                tres = E(k-1,1) + D(u,j);
                E(k,t + 2) =  min([uno dos tres]);
            end

            %%%%%%%%%%%%%%%
            r = obtenerR(a,b);
            uno = E(s+1,t+2) + p;
            dos = E(s+2,t+1) + q;
            tres = E(s+1,t+1) + r;
            D(i,j) =  min([uno dos tres]);
            %disp(D);
        end
    end
    %disp(D);
    d = D(n+1,m+1);
end

function r = obtenerR(a,b)
    if a == b
        r = 0;
    else
        r = 1;
    end
end

function node = buscarHijo(tree,padre,hijo)
    node = tree(padre,hijo);
end

function r = rankNode(tree,node)
    N = nodes(tree,node);
    if N > 1
        r = 2;
    else
        r = 0;
    end
end

function node = hmenos1(tree,indice)
    node = find(tree(:,5) == indice);
end

function indice = h(tree,node)
    indice = tree(node,5);
end

function N = nodes(tree,node)
    N = tree(node,4);
end

