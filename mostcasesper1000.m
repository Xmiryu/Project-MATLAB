%wska�niki dotycz�ce zaka�e� ? najwi�cej na 1000/mieszka�c�w,
function mostcasesper1000
    opts = detectImportOptions('uzupelnione_dane.xlsx');
    opts.SelectedVariableNames = {'Country','CasesPer1000Population'};
    data = readtable('uzupelnione_dane.xlsx',opts);
    data = sortrows(data, 'CasesPer1000Population', 'descend');
    tmp = data(1:15,1:2);
    bar(table2array(tmp(:,2)));
    set(gca, 'xtick', 1:15, 'xticklabel', table2array(tmp(:,1)));
    xtickangle(45);
    ylabel("CasesPer1000Population");
    xlabel("Country");
    title("Najwi�cej zaka�e� na 1000mieszka�c�w");
end