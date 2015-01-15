Points_0304 = [3;6;9;12;13;14;17;20;23;24;27;30;33;34;35;38;39;42;45;46;49;52;55;58;61;64;67;70;73;74;77;78;81;82;83;84;87;90];
plot (Points_0304,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 2003-2004') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38])
ylim ([0 100])
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on')
%gtext('2nd') %add text to graph