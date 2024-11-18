function printSmithPDF(fignumber, title, gamma, frequency)
    
    figure(fignumber);
    s1 = smithplot(frequency, gamma);
    s1.TitleTop = title;

    set(gcf, 'PaperUnits', 'points');
    set(gcf, 'PaperPosition', [0 0 800 1200]); % Adjust the figure size for 3 plots
    set(gcf, 'PaperSize', [800 1200]);

end