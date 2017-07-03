function [mdiagonal,mdiagonalT] = matrizDiagonal(array,m,nombres)
    if nargin < 3
       RowNames =cellstr(string(1:m));
    else
        RowNames=nombres;
        VariableNames= nombres;
    end

    mdiagonal = triu(ones(m),1);
    mdiagonal(mdiagonal==0) = NaN;
    mdiagonal =mdiagonal';
    mdiagonal(mdiagonal==1) = array;
    mdiagonal =mdiagonal';
    if exist( 'VariableNames','var')
        mdiagonalT = array2table( mdiagonal,'RowNames',RowNames, 'VariableNames', VariableNames);
    else
        mdiagonalT = array2table( mdiagonal,'RowNames',RowNames);
    end
    %disp(mdiagonalT);
end