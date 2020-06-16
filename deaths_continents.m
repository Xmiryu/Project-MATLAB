%wska¼niki dotycz±ce zgonów - ilo¶æ na poszczególnych kontynentach
function deaths_continents
    opts = detectImportOptions('kontynenty_dane.xlsx');
    opts.SelectedVariableNames = {'Continent','Deaths'};
    data = readtable('kontynenty_dane.xlsx',opts);
    tmp = data(:,1:2);
    b = bar(table2array(tmp(:,2)));
    set(gca, 'xtick', 1:6, 'xticklabel', table2array(tmp(:,1)));
    xtickangle(45);
    ylabel("Deaths");
    xlabel("Continent");
    title("Zgony wed³ug kontynentu");
    
    xtips = b(1).XEndPoints;
    ytips = b(1).YEndPoints;
    labels = string(b(1).YData);
    text(xtips,ytips,labels,'HorizontalAlignment','center','VerticalAlignment','bottom')
end