%Our training data
West_Ham_NBC = [1 0 1 1 2;0 1 1 1 2;0 1 1 1 2;1 1 1 1 2;1 0 1 1 2;0 1 1 1 1;1 0 1 1 1;0 1 1 1 2;1 0 1 1 2;0 1 1 1 2;1 0 1 1 0;0 1 1 1 0;1 1 1 1 0;0 0 0 0 1;1 0 1 1 2;0 0 1 1 1;1 0 1 1 2;0 1 1 1 1;1 0 1 1 2;0 1 1 1 2;1 0 1 1 2;0 1 1 0 0;0 0 0 1 2;1 0 0 1 2;0 1 1 1 1;1 0 1 1 2;0 0 1 1 2;];
West_HamY = West_Ham_NBC(:,5); %get our class variable
West_Ham_NBC = West_Ham_NBC(:,1:4)'; %features are now displayed correct way

West_HamW = West_HamY; %new array to begin first binary classification
West_HamW(West_HamW==1)=0; %change all draws to a 0
West_HamW(West_HamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (West_HamW) / size (West_HamW,1); %get probability of a win
pNW = sum (1-West_HamW) / size (West_HamW,1); %get probability of other results

%P(x_i|Y):
phiW = West_Ham_NBC * West_HamW / sum(West_HamW); %all instances where (i) = 1 and there is a win
phiNW = West_Ham_NBC * (1-West_HamW) / sum(1-West_HamW); %all instances where (i) = 0 and its another result

%test point
West_HamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXW = prod(phiW.^West_HamX.*(1-phiW).^(1-West_HamX));
pWest_HamXNW = prod(phiNW.^West_HamX.*(1-phiNW).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXWF = (pWest_HamXW * pW ) / (pWest_HamXW + pWest_HamXNW); %Y=1
pWest_HamXNWF = (pWest_HamXNW * pW ) / (pWest_HamXW + pWest_HamXNW); %Y=0

West_HamD = West_HamY; %new array to begin second binary classification
West_HamD(West_HamD==2)=0; %change all wins to a 0

pD = sum (West_HamD) / size (West_HamD,1); %probability of a draw
pND = sum (1-West_HamD) / size (West_HamD,1); %probability of not drawing

%P(x_i|Y):
phiD = West_Ham_NBC * West_HamD / sum(West_HamD); %all instances where (i) = 1 and there is a win
phiND = West_Ham_NBC * (1-West_HamD) / sum(1-West_HamD); %all instances where (i) = 0 and its another result

%test point
West_HamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXD = prod(phiD.^West_HamX.*(1-phiD).^(1-West_HamX));
pWest_HamXND = prod(phiND.^West_HamX.*(1-phiND).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXDF = (pWest_HamXD * pD ) / (pWest_HamXD + pWest_HamXND); %Y=1
pWest_HamXNDF = (pWest_HamXND * pD ) / (pWest_HamXD + pWest_HamXND); %Y=0

West_HamL = West_HamY; %new array to begin second binary classification
West_HamL(West_HamL==1)=3; %change all draws to a 3
West_HamL(West_HamL==0)=1; %change all losses to a 1
West_HamL(West_HamL==2)=0; %change all wins to a 0
West_HamL(West_HamL==3)=0; %change all draws to a 0

pL = sum (West_HamL) / size (West_HamL,1); %probability of a draw
pNL = sum (1-West_HamL) / size (West_HamL,1); %probability of not drawing

%P(x_i|Y):
phiL = West_Ham_NBC * West_HamL / sum(West_HamL); %all instances where (i) = 1 and there is a win
phiNL = West_Ham_NBC * (1-West_HamL) / sum(1-West_HamL); %all instances where (i) = 0 and its another result

%test point
West_HamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXL = prod(phiL.^West_HamX.*(1-phiL).^(1-West_HamX));
pWest_HamXNL = prod(phiNL.^West_HamX.*(1-phiNL).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXLF = (pWest_HamXL * pL ) / (pWest_HamXL + pWest_HamXNL); %Y=1
pWest_HamXNLF = (pWest_HamXNL * pL ) / (pWest_HamXL + pWest_HamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pWest_HamXW;
Draw = pWest_HamXD;
Lose = pMan_UnitedXL;
West_Ham_Probs = [Win, Draw, Lose];
West_Ham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(West_Ham_Probs);

West_Ham_str = ['Arsenal vs West Ham: Arsenal will ',West_Ham_Probs_name{ind}];
disp(West_Ham_str)




