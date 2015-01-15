%Our training data
Hull_NBC = [0 1 1 1 2;1 0 1 1 2;0 0 1 1 2;1 1 1 1 0;];

HullY = Hull_NBC(:,5); %get our class variable
Hull_NBC = Hull_NBC(:,1:4)'; %features are now displayed correct way

HullW = HullY; %new array to begin first binary classification
HullW(HullW==1)=0; %change all draws to a 0
HullW(HullW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (HullW) / size (HullW,1); %get probability of a win
pNW = sum (1-HullW) / size (HullW,1); %get probability of other results

%P(x_i|Y):
phiW = Hull_NBC * HullW / sum(HullW); %all instances where (i) = 1 and there is a win
phiNW = Hull_NBC * (1-HullW) / sum(1-HullW); %all instances where (i) = 0 and its another result

%test point
HullX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pHullXW = prod(phiW.^HullX.*(1-phiW).^(1-HullX));
pHullXNW = prod(phiNW.^HullX.*(1-phiNW).^(1-HullX));

%P(Y=1|X) & P(Y=0|X):
pHullXWF = (pHullXW * pW ) / (pHullXW + pHullXNW); %Y=1
pxHullXNWF = (pHullXNW * pW ) / (pHullXW + pHullXNW); %Y=0

HullD = HullY; %new array to begin second binary classification
HullD(HullD==2)=0; %change all wins to a 0

pD = sum (HullD) / size (HullD,1); %probability of a draw
pND = sum (1-HullD) / size (HullD,1); %probability of not drawing

%P(x_i|Y):
phiD = Hull_NBC * HullD / sum(HullD); %all instances where (i) = 1 and there is a win
phiND = Hull_NBC * (1-HullD) / sum(1-HullD); %all instances where (i) = 0 and its another result

%test point
HullX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pHullXD = prod(phiD.^HullX.*(1-phiD).^(1-HullX));
pHullXND = prod(phiND.^HullX.*(1-phiND).^(1-HullX));

%P(Y=1|X) & P(Y=0|X):
pHullXDF = (pHullXD * pD ) / (pHullXD + pHullXND); %Y=1
pHullXNDF = (pHullXND * pD ) / (pHullXD + pHullXND); %Y=0

HullL = HullY; %new array to begin second binary classification
HullL(HullL==1)=3; %change all draws to a 3
HullL(HullL==0)=1; %change all losses to a 1
HullL(HullL==2)=0; %change all wins to a 0
HullL(HullL==3)=0; %change all draws to a 0

pL = sum (HullL) / size (HullL,1); %probability of a draw
pNL = sum (1-HullL) / size (HullL,1); %probability of not drawing

%P(x_i|Y):
phiL = Hull_NBC * HullL / sum(HullL); %all instances where (i) = 1 and there is a win
phiNL = Hull_NBC * (1-HullL) / sum(1-HullL); %all instances where (i) = 0 and its another result

%test point
HullX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pHullXL = prod(phiL.^HullX.*(1-phiL).^(1-HullX));
pHullXNL = prod(phiNL.^HullX.*(1-phiNL).^(1-HullX));

%P(Y=1|X) & P(Y=0|X):
pHullXLF = (pHullXL * pL ) / (pHullXL + pHullXNL); %Y=1
pHullXNLF = (pHullXNL * pL ) / (pHullXL + pHullXNL); %Y=0

%voting system chooses the probability with highest value
Win = pHullXW;
Draw = pHullXD;
Lose = pHullXL;
Hull_Probs = [Win, Draw, Lose];
Hull_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Hull_Probs);

Hull_str = ['Arsenal vs Hull: Arsenal will ',Hull_Probs_name{ind}];
disp(Hull_str)




