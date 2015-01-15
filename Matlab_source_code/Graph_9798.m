Points_9798 = [1;4;7;8;9;12;15;18;19;22;23;24;24;27;27;27;30;30;33;34;37;38;41;44;47;48;51;54;57;60;63;66;69;72;75;78;78;78];
plot (Points_9798,'-bs', 'LineWidth', 1, 'MarkerEdgeColor', 'r') %plot points and specify style
title ('Arsenal FC 1997-1998') %title
xlabel ('Games Played') %x axis label
ylabel ('Points') %y axis label
box off %take off top and z-axis solid lines
xlim ([1 38]) %set limits of x axis
ylim ([0 100]) %set limits of y axis 
%set(gcf, 'Color', [1,0.2,0.2])
set(gca, 'XTick', 1:1:38, 'YGrid', 'on') % set tick markers and set grid of y axis to on
%gtext('2nd') %add text to graph