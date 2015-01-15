function [ t ]  = function_h2hTable(x)

%head2head5 = {'HomeAway' 'Result' 'WDL' 'GS' 'GC'}; % create column headers
%head2head4 = {'HomeAway' 'Result' 'WDL' 'Points'}; % create column headers

c = cell2table(x); % change cell to table 
if  width(c) == 5
    %c.Properties.VariableNames = head2head5; % set column headers
    c.(4) = []; % delete 4th column
    c.(4) = []; % delete 5th column
elseif width(c) == 4
    %c.Properties.VariableNames = head2head4; % set column headers
    c.(4) = []; % delete the 4th column
end

t = table2cell(c);
prompt = 'Save file as:';
str = input(prompt, 's');
assignin('base', str, t);