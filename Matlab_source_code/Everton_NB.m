%Our training data
Everton_NBC = [0 0 1 1 1;1 0 0 1 1;0 0 1 0 2;1 1 1 0 2;1 1 1 1 2;0 0 1 0 2;1 1 1 1 1;0 0 0 0 2;0 1 1 1 1;1 0 1 1 2;1 0 1 0 2;0 0 1 1 2;0 0 1 1 0;1 1 0 1 1;0 1 1 1 0;1 1 1 0 2;1 0 1 1 2;0 1 0 0 2;0 1 1 1 1;1 0 0 0 2;1 1 1 1 2;0 0 1 1 0;1 0 1 1 2;0 0 1 1 2;1 1 1 1 2;0 0 1 1 0;0 0 1 1 2;1 1 0 1 2;0 0 1 1 2;1 1 1 1 2;1 0 1 1 2;0 0 1 1 1;0 0 1 1 2;1 1 1 1 2;];

EvertonY = Everton_NBC(:,5); %get our class variable
Everton_NBC = Everton_NBC(:,1:4)'; %features are now displayed correct way

EvertonW = EvertonY; %new array to begin first binary classification
EvertonW(EvertonW==1)=0; %change all draws to a 0
EvertonW(EvertonW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (EvertonW) / size (EvertonW,1); %get probability of a win
pNW = sum (1-EvertonW) / size (EvertonW,1); %get probability of other results

%P(x_i|Y):
phiW = Everton_NBC * EvertonW / sum(EvertonW); %all instances where (i) = 1 and there is a win
phiNW = Everton_NBC * (1-EvertonW) / sum(1-EvertonW); %all instances where (i) = 0 and its another result

%test point
EvertonX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXW = prod(phiW.^EvertonX.*(1-phiW).^(1-EvertonX));
pEvertonXNW = prod(phiNW.^EvertonX.*(1-phiNW).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXWF = (pEvertonXW * pW ) / (pEvertonXW + pEvertonXNW); %Y=1
pxEvertonXNWF = (pEvertonXNW * pW ) / (pEvertonXW + pEvertonXNW); %Y=0

EvertonD = EvertonY; %new array to begin second binary classification
EvertonD(EvertonD==2)=0; %change all wins to a 0

pD = sum (EvertonD) / size (EvertonD,1); %probability of a draw
pND = sum (1-EvertonD) / size (EvertonD,1); %probability of not drawing

%P(x_i|Y):
phiD = Everton_NBC * EvertonD / sum(EvertonD); %all instances where (i) = 1 and there is a win
phiND = Everton_NBC * (1-EvertonD) / sum(1-EvertonD); %all instances where (i) = 0 and its another result

%test point
EvertonX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXD = prod(phiD.^EvertonX.*(1-phiD).^(1-EvertonX));
pEvertonXND = prod(phiND.^EvertonX.*(1-phiND).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXDF = (pEvertonXD * pD ) / (pEvertonXD + pEvertonXND); %Y=1
pEvertonXNDF = (pEvertonXND * pD ) / (pEvertonXD + pEvertonXND); %Y=0

EvertonL = EvertonY; %new array to begin second binary classification
EvertonL(EvertonL==1)=3; %change all draws to a 3
EvertonL(EvertonL==0)=1; %change all losses to a 1
EvertonL(EvertonL==2)=0; %change all wins to a 0
EvertonL(EvertonL==3)=0; %change all draws to a 0

pL = sum (EvertonL) / size (EvertonL,1); %probability of a draw
pNL = sum (1-EvertonL) / size (EvertonL,1); %probability of not drawing

%P(x_i|Y):
phiL = Everton_NBC * EvertonL / sum(EvertonL); %all instances where (i) = 1 and there is a win
phiNL = Everton_NBC * (1-EvertonL) / sum(1-EvertonL); %all instances where (i) = 0 and its another result

%test point
EvertonX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXL = prod(phiL.^EvertonX.*(1-phiL).^(1-EvertonX));
pEvertonXNL = prod(phiNL.^EvertonX.*(1-phiNL).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXLF = (pEvertonXL * pL ) / (pEvertonXL + pEvertonXNL); %Y=1
pxEvertonXNLF = (pEvertonXNL * pL ) / (pEvertonXL + pEvertonXNL); %Y=0

%voting system chooses the probability with highest value
Win = pEvertonXW;
Draw = pEvertonXD;
Lose = pEvertonXL;
Everton_Probs = [Win, Draw, Lose];
Everton_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Everton_Probs);

Everton_str = ['Arsenal vs Everton: Arsenal will ',Everton_Probs_name{ind}];
disp(Everton_str)




