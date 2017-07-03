function dend = guardarDendogramas( enlaces,nombres )
%UNTITLED Summary of this function goes here

    dt = datestr(now,'yyyyddmmHHMMSS');
    folderName = strcat('experimento',dt);
    mkdir(folderName);
    cd(folderName);
    
    for i=1 : length(enlaces)      
        enlace = enlaces(i).enlace;
        f = figure('visible','off');%figure;
        [H,T,outperm] = dendrogram(enlace,0);
        dend(i).H = H;
        dend(i).T = T;
        dend(i).outperm = outperm;
        t = title(nombres(i));
        set(t, 'FontSize', 20);
        saveas(f,char(nombres(i)),'png');
    end
    cd '..';

end

