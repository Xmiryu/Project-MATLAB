%wska¼niki dotycz±ce zaka¿eñ - ilo¶æ na poszczególnych kontynentach
function cases_continents
    opts = detectImportOptions('kontynenty_dane.xlsx');
    opts.SelectedVariableNames = {'Continent','Cases'};
    data = readtable('kontynenty_dane.xlsx',opts);
    tmp = data(:,1:2);
    b = bar(table2array(tmp(:,2)));
    set(gca, 'xtick', 1:6, 'xticklabel', table2array(tmp(:,1)));
    xtickangle(45);
    ylabel("Cases");
    xlabel("Continent");
    title("Zaka¿enia wed³ug kontynentu");
    
    xtips = b(1).XEndPoints;
    ytips = b(1).YEndPoints;
    labels = string(b(1).YData);
    text(xtips,ytips,labels,'HorizontalAlignment','center','VerticalAlignment','bottom')
end