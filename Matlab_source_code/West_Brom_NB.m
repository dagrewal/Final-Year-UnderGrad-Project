%Our training data
West_Brom_NBC = [0 0 1 1 2;1 1 0 1 2;0 0 1 1 2;1 1 1 0 2;0 1 1 1 1;1 1 1 1 0;0 0 1 1 2;1 1 0 0 2;1 0 1 1 2;0 0 1 1 0;0 0 1 1 2;1 0 1 1 1;0 0 1 1 2;1 0 1 1 2;];
West_BromY = West_Brom_NBC(:,5); %get our class variable
West_Brom_NBC = West_Brom_NBC(:,1:4)'; %features are now displayed correct way

West_BromW = West_BromY; %new array to begin first binary classification
West_BromW(West_BromW==1)=0; %change all draws to a 0
West_BromW(West_BromW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (West_BromW) / size (West_BromW,1); %get probability of a win
pNW = sum (1-West_BromW) / size (West_BromW,1); %get probability of other results

%P(x_i|Y):
phiW = West_Brom_NBC * West_BromW / sum(West_BromW); %all instances where (i) = 1 and there is a win
phiNW = West_Brom_NBC * (1-West_BromW) / sum(1-West_BromW); %all instances where (i) = 0 and its another result

%test point
West_BromX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXW = prod(phiW.^West_BromX.*(1-phiW).^(1-West_BromX));
pWest_BromXNW = prod(phiNW.^West_BromX.*(1-phiNW).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXWF = (pWest_BromXW * pW ) / (pWest_BromXW + pWest_BromXNW); %Y=1
pWest_BromXNWF = (pWest_BromXNW * pW ) / (pWest_BromXW + pWest_BromXNW); %Y=0

West_BromD = West_BromY; %new array to begin second binary classification
West_BromD(West_BromD==2)=0; %change all wins to a 0

pD = sum (West_BromD) / size (West_BromD,1); %probability of a draw
pND = sum (1-West_BromD) / size (West_BromD,1); %probability of not drawing

%P(x_i|Y):
phiD = West_Brom_NBC * West_BromD / sum(West_BromD); %all instances where (i) = 1 and there is a win
phiND = West_Brom_NBC * (1-West_BromD) / sum(1-West_BromD); %all instances where (i) = 0 and its another result

%test point
West_BromX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXD = prod(phiD.^West_BromX.*(1-phiD).^(1-West_BromX));
pWest_BromXND = prod(phiND.^West_BromX.*(1-phiND).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXDF = (pWest_BromXD * pD ) / (pWest_BromXD + pWest_BromXND); %Y=1
pWest_BromXNDF = (pWest_BromXND * pD ) / (pWest_BromXD + pWest_BromXND); %Y=0

West_BromL = West_BromY; %new array to begin second binary classification
West_BromL(West_BromL==1)=3; %change all draws to a 3
West_BromL(West_BromL==0)=1; %change all losses to a 1
West_BromL(West_BromL==2)=0; %change all wins to a 0
West_BromL(West_BromL==3)=0; %change all draws to a 0

pL = sum (West_BromL) / size (West_BromL,1); %probability of a draw
pNL = sum (1-West_BromL) / size (West_BromL,1); %probability of not drawing

%P(x_i|Y):
phiL = West_Brom_NBC * West_BromL / sum(West_BromL); %all instances where (i) = 1 and there is a win
phiNL = West_Brom_NBC * (1-West_BromL) / sum(1-West_BromL); %all instances where (i) = 0 and its another result

%test point
West_BromX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXL = prod(phiL.^West_BromX.*(1-phiL).^(1-West_BromX));
pWest_BromXNL = prod(phiNL.^West_BromX.*(1-phiNL).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXLF = (pWest_BromXL * pL ) / (pWest_BromXL + pWest_BromXNL); %Y=1
pWest_BromXNLF = (pWest_BromXNL * pL ) / (pWest_BromXL + pWest_BromXNL); %Y=0

%voting system chooses the probability with highest value
Win = pWest_BromXW;
Draw = pWest_BromXD;
Lose = pMan_UnitedXL;
West_Brom_Probs = [Win, Draw, Lose];
West_Brom_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(West_Brom_Probs);

West_Brom_str = ['Arsenal vs West Brom: Arsenal will ',West_Brom_Probs_name{ind}];
disp(West_Brom_str)




