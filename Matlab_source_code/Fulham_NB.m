%Our training data
Fulham_NBC = [0 0 1 1 2;1 1 0 1 1;0 0 1 0 0;1 1 1 0 1;0 0 1 0 1;1 1 1 1 2;1 0 1 1 2;0 1 1 0 2;1 1 1 0 1;0 0 0 1 0;0 0 1 1 2;1 0 0 0 2;1 0 1 1 2;0 0 1 1 0;0 0 1 1 2;1 0 1 1 2;1 0 1 1 2;0 0 1 1 2;0 0 1 1 2;1 1 1 1 1;1 0 1 1 2;0 1 1 1 2;1 1 1 0 2;0 1 1 1 2;];

FulhamY = Fulham_NBC(:,5); %get our class variable
Fulham_NBC = Fulham_NBC(:,1:4)'; %features are now displayed correct way

FulhamW = FulhamY; %new array to begin first binary classification
FulhamW(FulhamW==1)=0; %change all draws to a 0
FulhamW(FulhamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (FulhamW) / size (FulhamW,1); %get probability of a win
pNW = sum (1-FulhamW) / size (FulhamW,1); %get probability of other results

%P(x_i|Y):
phiW = Fulham_NBC * FulhamW / sum(FulhamW); %all instances where (i) = 1 and there is a win
phiNW = Fulham_NBC * (1-FulhamW) / sum(1-FulhamW); %all instances where (i) = 0 and its another result

%test point
FulhamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pFulhamXW = prod(phiW.^FulhamX.*(1-phiW).^(1-FulhamX));
pFulhamXNW = prod(phiNW.^FulhamX.*(1-phiNW).^(1-FulhamX));

%P(Y=1|X) & P(Y=0|X):
pFulhamXWF = (pFulhamXW * pW ) / (pFulhamXW + pFulhamXNW); %Y=1
pxFulhamXNWF = (pFulhamXNW * pW ) / (pFulhamXW + pFulhamXNW); %Y=0

FulhamD = FulhamY; %new array to begin second binary classification
FulhamD(FulhamD==2)=0; %change all wins to a 0

pD = sum (FulhamD) / size (FulhamD,1); %probability of a draw
pND = sum (1-FulhamD) / size (FulhamD,1); %probability of not drawing

%P(x_i|Y):
phiD = Fulham_NBC * FulhamD / sum(FulhamD); %all instances where (i) = 1 and there is a win
phiND = Fulham_NBC * (1-FulhamD) / sum(1-FulhamD); %all instances where (i) = 0 and its another result

%test point
FulhamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pFulhamXD = prod(phiD.^FulhamX.*(1-phiD).^(1-FulhamX));
pFulhamXND = prod(phiND.^FulhamX.*(1-phiND).^(1-FulhamX));

%P(Y=1|X) & P(Y=0|X):
pFulhamXDF = (pFulhamXD * pD ) / (pFulhamXD + pFulhamXND); %Y=1
pFulhamXNDF = (pFulhamXND * pD ) / (pFulhamXD + pFulhamXND); %Y=0

FulhamL = FulhamY; %new array to begin second binary classification
FulhamL(FulhamL==1)=3; %change all draws to a 3
FulhamL(FulhamL==0)=1; %change all losses to a 1
FulhamL(FulhamL==2)=0; %change all wins to a 0
FulhamL(FulhamL==3)=0; %change all draws to a 0

pL = sum (FulhamL) / size (FulhamL,1); %probability of a draw
pNL = sum (1-FulhamL) / size (FulhamL,1); %probability of not drawing

%P(x_i|Y):
phiL = Fulham_NBC * FulhamL / sum(FulhamL); %all instances where (i) = 1 and there is a win
phiNL = Fulham_NBC * (1-FulhamL) / sum(1-FulhamL); %all instances where (i) = 0 and its another result

%test point
FulhamX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pFulhamXL = prod(phiL.^FulhamX.*(1-phiL).^(1-FulhamX));
pFulhamXNL = prod(phiNL.^FulhamX.*(1-phiNL).^(1-FulhamX));

%P(Y=1|X) & P(Y=0|X):
pFulhamXLF = (pFulhamXL * pL ) / (pFulhamXL + pFulhamXNL); %Y=1
pxFulhamXNLF = (pFulhamXNL * pL ) / (pFulhamXL + pFulhamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pFulhamXW;
Draw = pFulhamXD;
Lose = pFulhamXL;
Fulham_Probs = [Win, Draw, Lose];
Fulham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Fulham_Probs);

Fulham_str = ['Arsenal vs Fulham: Arsenal will ',Fulham_Probs_name{ind}];
disp(Fulham_str)




