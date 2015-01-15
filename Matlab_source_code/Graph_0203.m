Points_0203 = [3;4;7;8;11;14;17;20;23;23;23;26;29;32;32;35;35;36;39;42;43;46;49;52;53;56;57;60;63;63;66;67;68;71;72;72;75;78];
plot (Points_0203,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2002-2003') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38])
ylim ([0 100])
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on')
%gtext('2nd') %add text to graph