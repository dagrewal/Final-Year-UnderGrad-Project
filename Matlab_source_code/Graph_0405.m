Points_0405 = [3;6;9;12;15;16;19;22;25;25;26;27;30;31;31;34;35;38;41;44;47;48;48;51;51;54;57;58;61;64;67;70;71;74;77;80;83;83];
plot (Points_0405,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2004-2005') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38])
ylim ([0 100])
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on')
%gtext('2nd') %add text to graph