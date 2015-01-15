Points_9697 = [20;21;24;25;25;28;31;34;35;35;36;37;40;40;43;46;47;48;48;48;51;54;57;57;60;63;64;65;65;68];
plot (Points_9697,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 1996-1997') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 30]) %set limits of x axis
ylim ([0 100]) %set limits of y axis 
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:30, 'YGrid', 'on') % set tick markers and set grid of y axis to on
%gtext('2nd') %add text to graph