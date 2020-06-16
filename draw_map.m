function draw_map

    set(0, 'DefaultFigureColor', [0.25, 0.25, 0.25]);

    opts = detectImportOptions('uzupelnione_dane.xlsx');
    opts.SelectedVariableNames = {'Cases','ISO3'}; 
    data = readtable('uzupelnione_dane.xlsx',opts);
    data = sortrows(data, 'Cases', 'descend');
    sorted = data(:,1:2);

    cases = table2array(sorted(:,1));
    code = table2array(sorted(:,2));

    S = shaperead('TM_WORLD_BORDERS_SIMPL-0.3.shp');
    tmp = string(extractfield(S, 'ISO3'));

    mapshow(S)

    step=round(length(code)/5);

    %legenda
    set(0,'defaultaxescolororder',[0.6350 0.0780 0.1840; 0.8500 0.3250 0.0980; 1 0 0; 0.9290 0.6940 0.1250; 0.75 0.75 0])
    p = plot(1,1,1,1, 1,1, 1,1, 1,1, 'LineWidth', 0.1);
    set(gca,'color',[0.25, 0.25, 0.25]);
    l1=['>'+string(cases(step))];
    l2=['>'+string(cases(2*step))];
    l3=['>'+string(cases(3*step))];
    l4=['>'+string(cases(4*step))];
    l5=['0 - '+string(cases(4*step))];
    legend(p,{l1, l2, l3, l4, l5},'Location','southwest')
    title('Zaka¿enia na ¶wiecie')

    for i=1:step %1
        if(ismember(code(i), tmp))
            val = find(tmp == code(i));
            mapshow(S(val),'FaceColor',[0.6350, 0.0780, 0.1840])
        end
    end
    for i=step:2*step%2
        if(ismember(code(i), tmp))
            val = find(tmp == code(i));
            mapshow(S(val),'FaceColor','red')
        end
    end
    for i=2*step:3*step%3
        if(ismember(code(i), tmp))
            val = find(tmp == code(i));
            mapshow(S(val),'FaceColor',[0.8500, 0.3250, 0.0980])
        end
    end
    for i=3*step:4*step%4
        if(ismember(code(i), tmp))
            val = find(tmp == code(i));
            mapshow(S(val),'FaceColor',[0.9290, 0.6940, 0.1250])
        end
    end
    for i=4*step:length(code)
        if(ismember(code(i), tmp))
            val = find(tmp == code(i));
            mapshow(S(val),'FaceColor',[0.75, 0.75, 0])
        end
    end


end