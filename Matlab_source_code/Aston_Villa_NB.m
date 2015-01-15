%Our training data
Aston_Villa_NBC = [1 1 1 1 2;0 1 1 1 1;1 0 1 1 2;0 0 1 1 2;1 0 1 0 0;0 1 0 1 2;0 1 0 1 1;1 0 0 0 2;0 0 1 0 1;1 1 1 1 0;1 0 1 1 1;0 1 1 0 2;0 1 1 1 2;1 1 0 0 1;1 1 1 1 2;0 0 1 1 1;0 0 1 1 2;1 0 1 1 2;0 0 1 1 2;1 0 1 1 2;0 1 1 1 1;1 1 1 0 2;0 1 1 1 2;1 1 1 1 2;0 1 1 1 1;1 0 1 0 2;0 1 0 0 1;1 0 0 0 2;1 0 0 1 2;0 1 0 0 0;0 0 1 1 0;1 0 0 1 1;1 0 0 0 1;];
Aston_VillaY = Aston_Villa_NBC(:,5); %get our class variable
Aston_Villa_NBC = Aston_Villa_NBC(:,1:4)'; %features are now displayed correct way

Aston_VillaW = Aston_VillaY; %new array to begin first binary classification
Aston_VillaW(Aston_VillaW==1)=0; %change all draws to a 0
Aston_VillaW(Aston_VillaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Aston_VillaW) / size (Aston_VillaW,1); %get probability of a win
pNW = sum (1-Aston_VillaW) / size (Aston_VillaW,1); %get probability of other results

%P(x_i|Y):
phiW = Aston_Villa_NBC * Aston_VillaW / sum(Aston_VillaW); %all instances where (i) = 1 and there is a win
phiNW = Aston_Villa_NBC * (1-Aston_VillaW) / sum(1-Aston_VillaW); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pAston_VillaXW = prod(phiW.^Aston_VillaX.*(1-phiW).^(1-Aston_VillaX));
pAston_VillaXNW = prod(phiNW.^Aston_VillaX.*(1-phiNW).^(1-Aston_VillaX));

%P(Y=1|X) & P(Y=0|X):
pAston_VillaXWF = (pAston_VillaXW * pW ) / (pAston_VillaXW + pAston_VillaXNW); %Y=1
pAston_VillaXNWF = (pAston_VillaXNW * pW ) / (pAston_VillaXW + pAston_VillaXNW); %Y=0

Aston_VillaD = Aston_VillaY; %new array to begin second binary classification
Aston_VillaD(Aston_VillaD==2)=0; %change all wins to a 0

pD = sum (Aston_VillaD) / size (Aston_VillaD,1); %probability of a draw
pND = sum (1-Aston_VillaD) / size (Aston_VillaD,1); %probability of not drawing

%P(x_i|Y):
phiD = Aston_Villa_NBC * Aston_VillaD / sum(Aston_VillaD); %all instances where (i) = 1 and there is a win
phiND = Aston_Villa_NBC * (1-Aston_VillaD) / sum(1-Aston_VillaD); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pAston_VillaXD = prod(phiD.^Aston_VillaX.*(1-phiD).^(1-Aston_VillaX));
pAston_VillaXND = prod(phiND.^Aston_VillaX.*(1-phiND).^(1-Aston_VillaX));

%P(Y=1|X) & P(Y=0|X):
pAston_VillaXDF = (pAston_VillaXD * pD ) / (pAston_VillaXD + pAston_VillaXND); %Y=1
pAston_VillaXNDF = (pAston_VillaXND * pD ) / (pAston_VillaXD + pAston_VillaXND); %Y=0

Aston_VillaL = Aston_VillaY; %new array to begin second binary classification
Aston_VillaL(Aston_VillaL==1)=3; %change all draws to a 3
Aston_VillaL(Aston_VillaL==0)=1; %change all losses to a 1
Aston_VillaL(Aston_VillaL==2)=0; %change all wins to a 0
Aston_VillaL(Aston_VillaL==3)=0; %change all draws to a 0

pL = sum (Aston_VillaL) / size (Aston_VillaL,1); %probability of a draw
pNL = sum (1-Aston_VillaL) / size (Aston_VillaL,1); %probability of not drawing

%P(x_i|Y):
phiL = Aston_Villa_NBC * Aston_VillaL / sum(Aston_VillaL); %all instances where (i) = 1 and there is a win
phiNL = Aston_Villa_NBC * (1-Aston_VillaL) / sum(1-Aston_VillaL); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pAston_VillaXL = prod(phiL.^Aston_VillaX.*(1-phiL).^(1-Aston_VillaX));
pAston_VillaXNL = prod(phiNL.^Aston_VillaX.*(1-phiNL).^(1-Aston_VillaX));

%P(Y=1|X) & P(Y=0|X):
pAston_VillaXLF = (pAston_VillaXL * pL ) / (pAston_VillaXL + pAston_VillaXNL); %Y=1
pAston_VillaXNLF = (pAston_VillaXNL * pL ) / (pAston_VillaXL + pAston_VillaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pAston_VillaXW;
Draw = pAston_VillaXD;
Lose = pMan_UnitedXL;
Aston_Villa_Probs = [Win, Draw, Lose];
Aston_Villa_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Aston_Villa_Probs);

Aston_Villa_str = ['Arsenal vs Aston Villa: Arsenal will ',Aston_Villa_Probs_name{ind}];
disp(Aston_Villa_str)




