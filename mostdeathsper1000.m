%wska¼niki dotycz±ce zgonów - najwiecej na 1000/mieszkañców,
function mostdeathsper1000
    opts = detectImportOptions('uzupelnione_dane.xlsx');
    opts.SelectedVariableNames = {'Country','DeathsPer1000Population'};
    data = readtable('uzupelnione_dane.xlsx',opts);
    data = sortrows(data, 'DeathsPer1000Population', 'descend');
    tmp = data(1:15,1:2);
    bar(table2array(tmp(:,2)));
    set(gca, 'xtick', 1:15, 'xticklabel', table2array(tmp(:,1)));
    xtickangle(45);
    ylabel("DeathsPer1000Population");
    xlabel("Country");
    title("Najwiêcej zgonów na 1000mieszkañców");
end