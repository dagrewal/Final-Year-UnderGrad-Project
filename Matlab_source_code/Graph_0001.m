Points_0001 = [0;3;6;7;8;11;12;15;18;21;24;27;28;28;28;31;34;35;35;38;39;39;40;41;44;47;50;50;53;54;57;60;60;63;66;69;70;70];
plot (Points_0001,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2000-2001') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38])
ylim ([0 100])
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on')
%gtext('2nd') %add text to graph





