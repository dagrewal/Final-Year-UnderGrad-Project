%Our training data
Tottenham_NBC = [0 1 1 1 0;1 0 0 1 2;1 1 0 0 2;0 1 0 0 0;0 0 1 1 1;1 1 1 1 0;0 1 1 0 0;1 1 1 1 2;0 0 1 1 1;1 0 1 1 1;1 1 1 1 2;0 0 0 1 2;0 0 1 1 1;1 0 1 1 2;1 1 1 1 1;0 1 0 0 1;1 0 1 1 2;0 1 1 0 2;0 0 1 1 1;1 1 1 1 2;0 1 1 1 1;1 1 1 1 2;1 0 1 1 2;0 1 1 1 1;1 0 1 1 2;0 0 1 1 1;1 1 1 1 2;0 1 0 1 0;0 0 1 1 2;1 1 0 1 1;0 0 1 1 1;1 0 1 1 1;0 0 1 1 1;1 0 1 0 2;];
TottenhamY = Tottenham_NBC(:,5); %get our class variable
Tottenham_NBC = Tottenham_NBC(:,1:4)'; %features are now displayed correct way

TottenhamW = TottenhamY; %new array to begin first binary classification
TottenhamW(TottenhamW==1)=0; %change all draws to a 0
TottenhamW(TottenhamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (TottenhamW) / size (TottenhamW,1); %get probability of a win
pNW = sum (1-TottenhamW) / size (TottenhamW,1); %get probability of other results

%P(x_i|Y):
phiW = Tottenham_NBC * TottenhamW / sum(TottenhamW); %all instances where (i) = 1 and there is a win
phiNW = Tottenham_NBC * (1-TottenhamW) / sum(1-TottenhamW); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXW = prod(phiW.^TottenhamX.*(1-phiW).^(1-TottenhamX));
pTottenhamXNW = prod(phiNW.^TottenhamX.*(1-phiNW).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXWF = (pTottenhamXW * pW ) / (pTottenhamXW + pTottenhamXNW); %Y=1
pTottenhamXNWF = (pTottenhamXNW * pW ) / (pTottenhamXW + pTottenhamXNW); %Y=0

TottenhamD = TottenhamY; %new array to begin second binary classification
TottenhamD(TottenhamD==2)=0; %change all wins to a 0

pD = sum (TottenhamD) / size (TottenhamD,1); %probability of a draw
pND = sum (1-TottenhamD) / size (TottenhamD,1); %probability of not drawing

%P(x_i|Y):
phiD = Tottenham_NBC * TottenhamD / sum(TottenhamD); %all instances where (i) = 1 and there is a win
phiND = Tottenham_NBC * (1-TottenhamD) / sum(1-TottenhamD); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXD = prod(phiD.^TottenhamX.*(1-phiD).^(1-TottenhamX));
pTottenhamXND = prod(phiND.^TottenhamX.*(1-phiND).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXDF = (pTottenhamXD * pD ) / (pTottenhamXD + pTottenhamXND); %Y=1
pTottenhamXNDF = (pTottenhamXND * pD ) / (pTottenhamXD + pTottenhamXND); %Y=0

TottenhamL = TottenhamY; %new array to begin second binary classification
TottenhamL(TottenhamL==1)=3; %change all draws to a 3
TottenhamL(TottenhamL==0)=1; %change all losses to a 1
TottenhamL(TottenhamL==2)=0; %change all wins to a 0
TottenhamL(TottenhamL==3)=0; %change all draws to a 0

pL = sum (TottenhamL) / size (TottenhamL,1); %probability of a draw
pNL = sum (1-TottenhamL) / size (TottenhamL,1); %probability of not drawing

%P(x_i|Y):
phiL = Tottenham_NBC * TottenhamL / sum(TottenhamL); %all instances where (i) = 1 and there is a win
phiNL = Tottenham_NBC * (1-TottenhamL) / sum(1-TottenhamL); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXL = prod(phiL.^TottenhamX.*(1-phiL).^(1-TottenhamX));
pTottenhamXNL = prod(phiNL.^TottenhamX.*(1-phiNL).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXLF = (pTottenhamXL * pL ) / (pTottenhamXL + pTottenhamXNL); %Y=1
pTottenhamXNLF = (pTottenhamXNL * pL ) / (pTottenhamXL + pTottenhamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pTottenhamXW;
Draw = pTottenhamXD;
Lose = pMan_UnitedXL;
Tottenham_Probs = [Win, Draw, Lose];
Tottenham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Tottenham_Probs);

Tottenham_str = ['Arsenal vs Tottenham: Arsenal will ',Tottenham_Probs_name{ind}];
disp(Tottenham_str)




