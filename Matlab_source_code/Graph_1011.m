Points_1011 = [1;4;7;10;11;11;11;14;17;20;20;23;23;23;26;29;29;32;33;36;37;40;43;46;47;50;53;54;55;56;59;60;61;61;64;64;64;65];
plot (Points_1011,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2010-2011') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38]) %set limits of x axis
ylim ([0 100]) %set limits of y axis 
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on') % set tick markers and set grid of y axis to on
%gtext('2nd') %add text to graph