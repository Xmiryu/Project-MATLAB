function cor = general_correllations(val1, val2)

    opts = detectImportOptions('uzupelnione_dane.xlsx');
    opts.SelectedVariableNames = [val1 val2]; 
    data = readtable('uzupelnione_dane.xlsx',opts);
    data = rmmissing(data);
    x = table2array(data(:,1));
    
    if(val1==val2) y = x;
    else y = table2array(data(:,2));
    end
        
    %kor = cov(x,y)/(sqrt(var(x)*var(y)))
    kor = corr(x,y);
    if(kor>0.9 || kor<-0.9)
        format long
        b1 = x\y;
        scatter(x,y)
        hold on
        y2 = b1*x;
        plot(x, y2)
    else
        scatter(x,y)
        disp('Wspolczynnik nie jest bliski 1 lub -1')
    end
    
    %labels
    xlabel(data.Properties.VariableNames{1});
    if(val1==val2) 
        ylabel(data.Properties.VariableNames{1});
    else
        ylabel(data.Properties.VariableNames{2});
    end
    hold off
cor = kor
end