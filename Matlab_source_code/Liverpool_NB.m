%Our training data
Liverpool_NBC = [1 1 1 1 1;0 0 0 1 2;0 0 1 0 2;1 1 0 1 0;1 0 1 1 1;0 0 0 0 1;1 0 1 0 2;0 1 1 1 2;0 1 0 0 1;1 0 1 0 1;1 1 1 0 1;0 1 1 0 1;0 0 1 0 0;1 1 1 1 2;1 1 1 0 2;0 0 1 0 0;1 0 1 1 2;0 1 1 0 0;1 1 1 1 2;0 1 1 1 2;0 1 1 0 1;1 0 1 0 1;1 1 1 0 1;0 0 1 0 2;0 0 0 1 0;1 0 0 0 2;1 0 1 0 0;0 0 1 0 0;1 1 0 1 1;0 0 0 0 1;0 0 1 1 0;1 0 1 0 0;1 0 0 0 0;];

LiverpoolY = Liverpool_NBC(:,5); %get our class variable
Liverpool_NBC = Liverpool_NBC(:,1:4)'; %features are now displayed correct way

LiverpoolW = LiverpoolY; %new array to begin first binary classification
LiverpoolW(LiverpoolW==1)=0; %change all draws to a 0
LiverpoolW(LiverpoolW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (LiverpoolW) / size (LiverpoolW,1); %get probability of a win
pNW = sum (1-LiverpoolW) / size (LiverpoolW,1); %get probability of other results

%P(x_i|Y):
phiW = Liverpool_NBC * LiverpoolW / sum(LiverpoolW); %all instances where (i) = 1 and there is a win
phiNW = Liverpool_NBC * (1-LiverpoolW) / sum(1-LiverpoolW); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXW = prod(phiW.^LiverpoolX.*(1-phiW).^(1-LiverpoolX));
pLiverpoolXNW = prod(phiNW.^LiverpoolX.*(1-phiNW).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pliverpoolXWF = (pLiverpoolXW * pW ) / (pLiverpoolXW + pLiverpoolXNW); %Y=1
pLiverpoolXNWF = (pLiverpoolXNW * pW ) / (pLiverpoolXW + pLiverpoolXNW); %Y=0

LiverpoolD = LiverpoolY; %new array to begin second binary classification
LiverpoolD(LiverpoolD==2)=0; %change all wins to a 0

pD = sum (LiverpoolD) / size (LiverpoolD,1); %probability of a draw
pND = sum (1-LiverpoolD) / size (LiverpoolD,1); %probability of not drawing

%P(x_i|Y):
phiD = Liverpool_NBC * LiverpoolD / sum(LiverpoolD); %all instances where (i) = 1 and there is a win
phiND = Liverpool_NBC * (1-LiverpoolD) / sum(1-LiverpoolD); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXD = prod(phiD.^LiverpoolX.*(1-phiD).^(1-LiverpoolX));
pLiverpoolXND = prod(phiND.^LiverpoolX.*(1-phiND).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pliverpoolXDF = (pLiverpoolXD * pD ) / (pLiverpoolXD + pLiverpoolXND); %Y=1
pLiverpoolXNDF = (pLiverpoolXND * pD ) / (pLiverpoolXD + pLiverpoolXND); %Y=0

LiverpoolL = LiverpoolY; %new array to begin second binary classification
LiverpoolL(LiverpoolL==1)=3; %change all draws to a 3
LiverpoolL(LiverpoolL==0)=1; %change all losses to a 1
LiverpoolL(LiverpoolL==2)=0; %change all wins to a 0
LiverpoolL(LiverpoolL==3)=0; %change all draws to a 0

pL = sum (LiverpoolL) / size (LiverpoolL,1); %probability of a draw
pNL = sum (1-LiverpoolL) / size (LiverpoolL,1); %probability of not drawing

%P(x_i|Y):
phiL = Liverpool_NBC * LiverpoolL / sum(LiverpoolL); %all instances where (i) = 1 and there is a win
phiNL = Liverpool_NBC * (1-LiverpoolL) / sum(1-LiverpoolL); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXL = prod(phiL.^LiverpoolX.*(1-phiL).^(1-LiverpoolX));
pLiverpoolXNL = prod(phiNL.^LiverpoolX.*(1-phiNL).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pLiverpoolXLF = (pLiverpoolXL * pL ) / (pLiverpoolXL + pLiverpoolXNL); %Y=1
pLiverpoolXNLF = (pLiverpoolXNL * pL ) / (pLiverpoolXL + pLiverpoolXNL); %Y=0

%voting system chooses the probability with highest value
Win = pLiverpoolXW;
Draw = pLiverpoolXD;
Lose = pLiverpoolXL;
Liverpool_Probs = [Win, Draw, Lose];
Liverpool_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Liverpool_Probs);

Liverpool_str = ['Arsenal vs Liverpool: Arsenal will ',Liverpool_Probs_name{ind}];
disp(Liverpool_str)




