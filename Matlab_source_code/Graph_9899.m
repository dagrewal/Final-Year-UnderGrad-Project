Points_9899 = [3;4;5;6;7;10;10;13;14;17;20;23;24;24;25;26;26;29;32;35;36;39;42;45;46;49;50;53;56;59;60;63;66;69;72;75;75;78];
plot (Points_9899,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 1998-1999') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38]) %set limits of x axis
ylim ([0 100]) %set limits of y axis 
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on') % set tick markers and set grid of y axis to on
%gtext('2nd') %add text to graph