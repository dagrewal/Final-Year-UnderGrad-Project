%Our training data
Southampton_NBC = [0 0 1 1 1;1 0 0 1 2;0 1 1 1 1;1 1 1 1 1;1 0 1 1 2;0 0 1 1 2;1 0 1 0 2;0 0 1 1 0;1 0 1 1 1;0 0 1 1 2;0 0 1 1 0;1 0 1 1 2;1 0 1 1 2;0 1 0 1 2;0 0 1 1 1;1 0 1 1 1;1 1 1 1 2;0 0 1 1 2;0 0 1 1 2;1 0 1 1 2;];
SouthamptonY = Southampton_NBC(:,5); %get our class variable
Southampton_NBC = Southampton_NBC(:,1:4)'; %features are now displayed correct way

SouthamptonW = SouthamptonY; %new array to begin first binary classification
SouthamptonW(SouthamptonW==1)=0; %change all draws to a 0
SouthamptonW(SouthamptonW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SouthamptonW) / size (SouthamptonW,1); %get probability of a win
pNW = sum (1-SouthamptonW) / size (SouthamptonW,1); %get probability of other results

%P(x_i|Y):
phiW = Southampton_NBC * SouthamptonW / sum(SouthamptonW); %all instances where (i) = 1 and there is a win
phiNW = Southampton_NBC * (1-SouthamptonW) / sum(1-SouthamptonW); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXW = prod(phiW.^SouthamptonX.*(1-phiW).^(1-SouthamptonX));
pSouthamptonXNW = prod(phiNW.^SouthamptonX.*(1-phiNW).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXWF = (pSouthamptonXW * pW ) / (pSouthamptonXW + pSouthamptonXNW); %Y=1
pSouthamptonXNWF = (pSouthamptonXNW * pW ) / (pSouthamptonXW + pSouthamptonXNW); %Y=0

SouthamptonD = SouthamptonY; %new array to begin second binary classification
SouthamptonD(SouthamptonD==2)=0; %change all wins to a 0

pD = sum (SouthamptonD) / size (SouthamptonD,1); %probability of a draw
pND = sum (1-SouthamptonD) / size (SouthamptonD,1); %probability of not drawing

%P(x_i|Y):
phiD = Southampton_NBC * SouthamptonD / sum(SouthamptonD); %all instances where (i) = 1 and there is a win
phiND = Southampton_NBC * (1-SouthamptonD) / sum(1-SouthamptonD); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXD = prod(phiD.^SouthamptonX.*(1-phiD).^(1-SouthamptonX));
pSouthamptonXND = prod(phiND.^SouthamptonX.*(1-phiND).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXDF = (pSouthamptonXD * pD ) / (pSouthamptonXD + pSouthamptonXND); %Y=1
pSouthamptonXNDF = (pSouthamptonXND * pD ) / (pSouthamptonXD + pSouthamptonXND); %Y=0

SouthamptonL = SouthamptonY; %new array to begin second binary classification
SouthamptonL(SouthamptonL==1)=3; %change all draws to a 3
SouthamptonL(SouthamptonL==0)=1; %change all losses to a 1
SouthamptonL(SouthamptonL==2)=0; %change all wins to a 0
SouthamptonL(SouthamptonL==3)=0; %change all draws to a 0

pL = sum (SouthamptonL) / size (SouthamptonL,1); %probability of a draw
pNL = sum (1-SouthamptonL) / size (SouthamptonL,1); %probability of not drawing

%P(x_i|Y):
phiL = Southampton_NBC * SouthamptonL / sum(SouthamptonL); %all instances where (i) = 1 and there is a win
phiNL = Southampton_NBC * (1-SouthamptonL) / sum(1-SouthamptonL); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXL = prod(phiL.^SouthamptonX.*(1-phiL).^(1-SouthamptonX));
pSouthamptonXNL = prod(phiNL.^SouthamptonX.*(1-phiNL).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXLF = (pSouthamptonXL * pL ) / (pSouthamptonXL + pSouthamptonXNL); %Y=1
pSouthamptonXNLF = (pSouthamptonXNL * pL ) / (pSouthamptonXL + pSouthamptonXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSouthamptonXW;
Draw = pSouthamptonXD;
Lose = pMan_UnitedXL;
Southampton_Probs = [Win, Draw, Lose];
Southampton_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Southampton_Probs);

Southampton_str = ['Arsenal vs Southampton: Arsenal will ',Southampton_Probs_name{ind}];
disp(Southampton_str)




