Points_9900 = [3;6;7;7;10;10;13;16;19;19;22;25;26;26;29;32;35;36;36;39;40;43;44;44;44;47;48;48;51;54;57;60;63;66;69;72;73;73];
plot (Points_9900,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 1999-2000') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38]) %set limits of x axis
ylim ([0 100]) %set limits of y axis 
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on') % set tick markers and set grid of y axis to on
%gtext('2nd') %add text to graph