Points_0102 = [3;3;6;7;10;11;14;17;18;19;19;20;23;26;29;30;30;33;36;39;40;41;44;47;48;51;54;57;60;63;66;69;72;75;78;81;84;87];
plot (Points_0102,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2001-2002') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38])
ylim ([0 100])
%set(gcf, 'Color', [1,0.2,0.2]) 
set(gca, 'XTick', 1:1:38, 'YGrid', 'on')
%gtext('2nd') %add text to graph
