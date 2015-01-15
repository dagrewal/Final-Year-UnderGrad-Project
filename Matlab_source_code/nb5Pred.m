function [msg ] = nb5Pred 
% assign the training set to new variables for each team, cleaner code
load('PredictionWorkspace.mat');
AstonVilla = Aston_Villa_NBC;
Chelsea = Chelsea_NBC;
Everton = Everton_NBC;
Fulham = Fulham_NBC;
Hull = Hull_NBC;
Liverpool = Liverpool_NBC;
ManCity = Man_City_NBC;
ManUtd = Man_United_NBC;
Newcastle = Newcastle_NBC;
Norwich = Norwich_NBC;
Southampton = Southampton_NBC;
Stoke = Stoke_NBC;
Sunderland = Sunderland_NBC;
Swansea = Swansea_NBC;
Tottenham = Tottenham_NBC;
WestBrom = West_Brom_NBC;
WestHam = West_Ham_NBC;

%create the dialog box for user to answer questions
prompt = {'Enter Opposition:'; 'Are Arsenal playing at home(Y/N)?';'Did Arsenal play a cup game prior to this league fixture(Y/N)?'; 
                'Enter result of Arsenal''s'' last league fixture(W/D/L):';
                'Was Arsenal''s last league fixture against an opposition who finished below them in the league table last season(Y/N)?';}; 
dlg_title = 'Make a prediction'; %title of dialog box
num_lines = 1; % number of lines available for each answer
answer = inputdlg(prompt, dlg_title, num_lines); %answer variable, output as a cell array

%assign answer from user input to new variable
newPred = answer;
team = {}; % create an empty cell array which will hold the opposition team name for which the prediction is being made

%manage team choice
if strcmp(newPred{1,1},'Aston Villa')
    newPred{1,1} = AstonVilla;
    team ={'Aston Villa'};
elseif strcmp(newPred{1,1}, 'Chelsea') 
    newPred{1,1} = Chelsea;
    team = {'Chelsea'};
elseif strcmp(newPred{1,1}, 'Everton') 
    newPred{1,1} = Everton;
    team = {'Everton'};
elseif strcmp(newPred{1,1}, 'Fulham')
    newPred{1,1} = Fulham;
    team = {'Fulham'};
elseif strcmp(newPred{1,1}, 'Hull')
    newPred{1,1} = Hull;
    team = {'Hull'};
elseif strcmp(newPred{1,1}, 'Liverpool')
    newPred{1,1} = Liverpool;
    team = {'Liverpool'};
elseif strcmp(newPred{1,1}, 'Manchester City')
    newPred{1,1} = ManCity;
    team = {'Manchester City'};
elseif strcmp(newPred{1,1}, 'Manchester United')
    newPred{1,1} = ManUtd;
    team = {'Manchester United'};
elseif strcmp(newPred{1,1}, 'Newcastle United')
    newPred{1,1} = Newcastle;
    team = {'Newcastle United'};
elseif strcmp(newPred{1,1}, 'Norwich')
    newPred{1,1} = Norwich;
    team = {'Norwich City'};
elseif strcmp(newPred{1,1}, 'Southampton')
    newPred{1,1} = Southampton;
    team = {'Southampton'};
elseif strcmp(newPred{1,1}, 'Stoke City')
    newPred{1,1} = Stoke;
    team = {'Stoke City'};
elseif strcmp(newPred{1,1}, 'Sunderland')
    newPred{1,1} = Sunderland;
    team = {'Sunderland'};
elseif strcmp(newPred{1,1}, 'Swansea City')
    newPred{1,1} = Swansea;
    team = {'Swansea'};
elseif strcmp(newPred{1,1}, 'Tottenham Hotspur')
    newPred{1,1} = Tottenham;
    team = {'Tottenham Hotspur'};
elseif strcmp(newPred{1,1}, 'West Brom')
    newPred{1,1} = WestBrom;
    team = {'West Brom'};
elseif strcmp(newPred{1,1}, 'West Ham')
    newPred{1,1} = WestHam;
    team = {'West Ham'};
else
    errordlg('Opposition not found', 'Entry Error');
end


%change home/away variable
if newPred{2,1} == 'Y'
    newPred{2,1} = 1;
elseif newPred{2,1} == 'N'
    newPred{2,1} = 0;
end

%change cg variable
if newPred{3,1} == 'Y'
    newPred{3,1} = 1;
elseif newPred{3,1} == 'N'
    newPred{3,1} = 0;
end

%change wlf variable
if newPred{4,1} == 'W'
    newPred{4,1} = 2;
elseif newPred{4,1} == 'L'
    newPred{4,1} = 0;
elseif newPred{4,1} == 'D'
    newPred{4,1} = 1;
end

%change rank variable
if newPred{5,1} == 'Y'
    newPred{5,1} = 1;
elseif newPred{5,1} == 'N'
    newPred{5,1} = 0;
end

testNewPred = newPred{2:5, end}; %assign the new prediction test point
nbc = newPred{1,1}; % assign the training data

nbc(:,3)=[];nbc(:,4)=[];
classVariableY = nbc(:,5); %get our class variable
nbc = nbc(:,1:4)'; %features are now displayed correct way

classVariableW = classVariableY; %new array to begin first binary classification
classVariableW(classVariableW==1)=0; %change all draws to a 0
classVariableW(classVariableW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (classVariableW) / size (classVariableW,1); %get probability of a win
pNW = sum (1-classVariableW) / size (classVariableW,1); %get probability of other results

%P(x_i|Y):
phiW = nbc * classVariableW / sum(classVariableW); %all instances where (i) = 1 and there is a win
phiNW = nbc * (1-classVariableW) / sum(1-classVariableW); %all instances where (i) = 0 and its another result

%test point
testNewPred = testNewPred'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pteamXW = prod(phiW.^testNewPred.*(1-phiW).^(1-testNewPred));
pteamXNW = prod(phiNW.^testNewPred.*(1-phiNW).^(1-testNewPred));

%P(Y=1|X) & P(Y=0|X):
pteamXWF = (pteamXW * pW ) / (pteamXW + pteamXNW); %Y=1
pteamXNWF = (pteamXNW * pW ) / (pteamXW + pteamXNW); %Y=0

classVariableD = classVariableY; %new array to begin second binary classification
classVariableD(classVariableD==2)=0; %change all wins to a 0

pD = sum (classVariableD) / size (classVariableD,1); %probability of a draw
pND = sum (1-classVariableD) / size (classVariableD,1); %probability of not drawing

%P(x_i|Y):
phiD = nbc * classVariableD / sum(classVariableD); %all instances where (i) = 1 and there is a win
phiND = nbc * (1-classVariableD) / sum(1-classVariableD); %all instances where (i) = 0 and its another result

%test point
testNewPred = testNewPred'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pteamXD = prod(phiD.^testNewPred.*(1-phiD).^(1-testNewPred));
pteamXND = prod(phiND.^testNewPred.*(1-phiND).^(1-testNewPred));

%P(Y=1|X) & P(Y=0|X):
pteamXDF = (pteamXD * pD ) / (pteamXD + pteamXND); %Y=1
pteamXNDF = (pteamXND * pD ) / (pteamXD + pteamXND); %Y=0

classVariableL = classVariableY; %new array to begin second binary classification
classVariableL(classVariableL==1)=3; %change all draws to a 3
classVariableL(classVariableL==0)=1; %change all losses to a 1
classVariableL(classVariableL==2)=0; %change all wins to a 0
classVariableL(classVariableL==3)=0; %change all draws to a 0

pL = sum (classVariableL) / size (classVariableL,1); %probability of a draw
pNL = sum (1-classVariableL) / size (classVariableL,1); %probability of not drawing

%P(x_i|Y):
phiL = nbc * classVariableL / sum(classVariableL); %all instances where (i) = 1 and there is a win
phiNL = nbc * (1-classVariableL) / sum(1-classVariableL); %all instances where (i) = 0 and its another result

%test point
testNewPred = testNewPred'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pteamXL = prod(phiL.^testNewPred.*(1-phiL).^(1-testNewPred));
pteamXNL = prod(phiNL.^testNewPred.*(1-phiNL).^(1-testNewPred));

%P(Y=1|X) & P(Y=0|X):
pteamXLF = (pteamXL * pL ) / (pteamXL + pteamXNL); %Y=1
pteamXNLF = (pteamXNL * pL ) / (pteamXL + pteamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pteamXWF;
Draw = pteamXDF;
Lose = pteamXLF;
teamProbs = [Win, Draw, Lose];
teamProbs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(teamProbs);

team_str = ['Arsenal vs' team ': Arsenal will ' teamProbs_name{ind}];
msg = msgbox(team_str, 'Predicted Outcome'); % message box pop up