Points_0607 = [1;1;2;5;8;11;14;17;18;18;21;22;22;22;25;26;29;30;33;36;36;39;42;45;46;49;52;55;55;55;55;56;59;62;63;66;67;68];
plot (Points_0607,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2006-2007') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38]) %set limits of x axis
ylim ([0 100]) %set limits of y axis 
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on') % set tick markers and set grid of y axis to on
%gtext('2nd') %add text to graph