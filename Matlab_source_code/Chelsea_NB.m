%Our training data
Chelsea_NBC = [0 1 0 0 0;1 1 0 0 0;1 0 1 0 1;0 1 0 0 2;1 0 1 0 2;0 1 0 0 0;0 0 1 0 0;1 1 1 0 0;1 1 1 0 0;0 1 0 0 0;0 0 1 0 0;1 1 1 0 2;1 0 0 0 1;0 1 0 0 1;1 0 0 0 0;0 0 1 0 0;0 1 1 0 1;1 1 1 0 1;0 1 1 1 2;1 0 0 1 2;1 0 1 0 2;0 0 1 1 1;1 0 1 0 2;0 0 1 0 1;1 1 0 1 1;0 0 1 1 1;1 0 1 1 2;0 1 1 0 2;1 1 0 1 2;0 0 0 1 1;1 0 0 0 2;0 1 0 0 2;0 0 1 1 2;];

ChelseaY = Chelsea_NBC(:,5); %get our class variable
Chelsea_NBC = Chelsea_NBC(:,1:4)'; %features are now displayed correct way

ChelseaW = ChelseaY; %new array to begin first binary classification
ChelseaW(ChelseaW==1)=0; %change all draws to a 0
ChelseaW(ChelseaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (ChelseaW) / size (ChelseaW,1); %get probability of a win
pNW = sum (1-ChelseaW) / size (ChelseaW,1); %get probability of other results

%P(x_i|Y):
phiW = Chelsea_NBC * ChelseaW / sum(ChelseaW); %all instances where (i) = 1 and there is a win
phiNW = Chelsea_NBC * (1-ChelseaW) / sum(1-ChelseaW); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pChelseaXW = prod(phiW.^ChelseaX.*(1-phiW).^(1-ChelseaX));
pChelseaXNW = prod(phiNW.^ChelseaX.*(1-phiNW).^(1-ChelseaX));

%P(Y=1|X) & P(Y=0|X):
pChelseaXWF = (pChelseaXW * pW ) / (pChelseaXW + pChelseaXNW); %Y=1
pxChelseaXNWF = (pChelseaXNW * pW ) / (pChelseaXW + pChelseaXNW); %Y=0

ChelseaD = ChelseaY; %new array to begin second binary classification
ChelseaD(ChelseaD==2)=0; %change all wins to a 0

pD = sum (ChelseaD) / size (ChelseaD,1); %probability of a draw
pND = sum (1-ChelseaD) / size (ChelseaD,1); %probability of not drawing

%P(x_i|Y):
phiD = Chelsea_NBC * ChelseaD / sum(ChelseaD); %all instances where (i) = 1 and there is a win
phiND = Chelsea_NBC * (1-ChelseaD) / sum(1-ChelseaD); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pChelseaXD = prod(phiD.^ChelseaX.*(1-phiD).^(1-ChelseaX));
pChelseaXND = prod(phiND.^ChelseaX.*(1-phiND).^(1-ChelseaX));

%P(Y=1|X) & P(Y=0|X):
pChelseaXDF = (pChelseaXD * pD ) / (pChelseaXD + pChelseaXND); %Y=1
pxChelseaXNDF = (pChelseaXND * pD ) / (pChelseaXD + pChelseaXND); %Y=0

ChelseaL = ChelseaY; %new array to begin second binary classification
ChelseaL(ChelseaL==1)=3; %change all draws to a 3
ChelseaL(ChelseaL==0)=1; %change all losses to a 1
ChelseaL(ChelseaL==2)=0; %change all wins to a 0
ChelseaL(ChelseaL==3)=0; %change all draws to a 0

pL = sum (ChelseaL) / size (ChelseaL,1); %probability of a draw
pNL = sum (1-ChelseaL) / size (ChelseaL,1); %probability of not drawing

%P(x_i|Y):
phiL = Chelsea_NBC * ChelseaL / sum(ChelseaL); %all instances where (i) = 1 and there is a win
phiNL = Chelsea_NBC * (1-ChelseaL) / sum(1-ChelseaL); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pChelseaXL = prod(phiL.^ChelseaX.*(1-phiL).^(1-ChelseaX));
pChelseaXNL = prod(phiNL.^ChelseaX.*(1-phiNL).^(1-ChelseaX));

%P(Y=1|X) & P(Y=0|X):
pChelseaXLF = (pChelseaXL * pL ) / (pChelseaXL + pChelseaXNL); %Y=1
pxChelseaXNLF = (pChelseaXNL * pL ) / (pChelseaXL + pChelseaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pChelseaXW;
Draw = pChelseaXD;
Lose = pChelseaXL;
Chelsea_Probs = [Win, Draw, Lose];
Chelsea_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Chelsea_Probs);

Chelsea_str = ['Arsenal vs Chelsea: Arsenal will ',Chelsea_Probs_name{ind}];
disp(Chelsea_str)




