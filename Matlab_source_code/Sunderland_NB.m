%Our training data
Sunderland_NBC = [0 0 1 1 2;1 0 0 0 1;0 0 1 0 2;1 0 1 0 2;1 1 1 1 1;0 1 1 1 1;1 1 1 1 2;0 0 1 1 0;1 0 1 1 1;0 1 1 1 1;0 0 1 1 2;1 1 1 1 2;0 1 1 1 2;1 1 1 1 2;0 0 1 1 2;1 1 1 1 2;1 0 1 1 2;0 1 1 1 1;1 0 1 0 1;0 0 0 0 0;1 1 1 1 2;0 0 1 1 1;0 1 1 1 0;];
SunderlandY = Sunderland_NBC(:,5); %get our class variable
Sunderland_NBC = Sunderland_NBC(:,1:4)'; %features are now displayed correct way

SunderlandW = SunderlandY; %new array to begin first binary classification
SunderlandW(SunderlandW==1)=0; %change all draws to a 0
SunderlandW(SunderlandW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SunderlandW) / size (SunderlandW,1); %get probability of a win
pNW = sum (1-SunderlandW) / size (SunderlandW,1); %get probability of other results

%P(x_i|Y):
phiW = Sunderland_NBC * SunderlandW / sum(SunderlandW); %all instances where (i) = 1 and there is a win
phiNW = Sunderland_NBC * (1-SunderlandW) / sum(1-SunderlandW); %all instances where (i) = 0 and its another result

%test point
SunderlandX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSunderlandXW = prod(phiW.^SunderlandX.*(1-phiW).^(1-SunderlandX));
pSunderlandXNW = prod(phiNW.^SunderlandX.*(1-phiNW).^(1-SunderlandX));

%P(Y=1|X) & P(Y=0|X):
pSunderlandXWF = (pSunderlandXW * pW ) / (pSunderlandXW + pSunderlandXNW); %Y=1
pSunderlandXNWF = (pSunderlandXNW * pW ) / (pSunderlandXW + pSunderlandXNW); %Y=0

SunderlandD = SunderlandY; %new array to begin second binary classification
SunderlandD(SunderlandD==2)=0; %change all wins to a 0

pD = sum (SunderlandD) / size (SunderlandD,1); %probability of a draw
pND = sum (1-SunderlandD) / size (SunderlandD,1); %probability of not drawing

%P(x_i|Y):
phiD = Sunderland_NBC * SunderlandD / sum(SunderlandD); %all instances where (i) = 1 and there is a win
phiND = Sunderland_NBC * (1-SunderlandD) / sum(1-SunderlandD); %all instances where (i) = 0 and its another result

%test point
SunderlandX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSunderlandXD = prod(phiD.^SunderlandX.*(1-phiD).^(1-SunderlandX));
pSunderlandXND = prod(phiND.^SunderlandX.*(1-phiND).^(1-SunderlandX));

%P(Y=1|X) & P(Y=0|X):
pSunderlandXDF = (pSunderlandXD * pD ) / (pSunderlandXD + pSunderlandXND); %Y=1
pSunderlandXNDF = (pSunderlandXND * pD ) / (pSunderlandXD + pSunderlandXND); %Y=0

SunderlandL = SunderlandY; %new array to begin second binary classification
SunderlandL(SunderlandL==1)=3; %change all draws to a 3
SunderlandL(SunderlandL==0)=1; %change all losses to a 1
SunderlandL(SunderlandL==2)=0; %change all wins to a 0
SunderlandL(SunderlandL==3)=0; %change all draws to a 0

pL = sum (SunderlandL) / size (SunderlandL,1); %probability of a draw
pNL = sum (1-SunderlandL) / size (SunderlandL,1); %probability of not drawing

%P(x_i|Y):
phiL = Sunderland_NBC * SunderlandL / sum(SunderlandL); %all instances where (i) = 1 and there is a win
phiNL = Sunderland_NBC * (1-SunderlandL) / sum(1-SunderlandL); %all instances where (i) = 0 and its another result

%test point
SunderlandX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSunderlandXL = prod(phiL.^SunderlandX.*(1-phiL).^(1-SunderlandX));
pSunderlandXNL = prod(phiNL.^SunderlandX.*(1-phiNL).^(1-SunderlandX));

%P(Y=1|X) & P(Y=0|X):
pSunderlandXLF = (pSunderlandXL * pL ) / (pSunderlandXL + pSunderlandXNL); %Y=1
pSunderlandXNLF = (pSunderlandXNL * pL ) / (pSunderlandXL + pSunderlandXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSunderlandXW;
Draw = pSunderlandXD;
Lose = pMan_UnitedXL;
Sunderland_Probs = [Win, Draw, Lose];
Sunderland_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Sunderland_Probs);

Sunderland_str = ['Arsenal vs Sunderland: Arsenal will ',Sunderland_Probs_name{ind}];
disp(Sunderland_str)




