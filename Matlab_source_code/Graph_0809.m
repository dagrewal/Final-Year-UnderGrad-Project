Points_0809 = [3;3;6;9;12;12;13;15;18;19;19;22;22;22;25;28;29;30;31;34;37;40;41;42;43;44;45;48;51;54;57;60;61;64;67;67;68;71];
plot (Points_0809,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2008-2009') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38]) %set limits of x axis
ylim ([0 100]) %set limits of y axis 
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on') % set tick markers and set grid of y axis to on
%gtext('2nd') %add text to graph