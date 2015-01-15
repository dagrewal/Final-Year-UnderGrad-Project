Points_0506 = [3;3;6;6;9;10;13;13;16;17;20;23;26;26;26;26;29;32;33;34;37;37;37;40;41;41;41;44;47;50;53;53;54;57;58;61;64;67];
plot (Points_0506,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2005-2006') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38])
ylim ([0 100])
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on')
%gtext('2nd') %add text to graph