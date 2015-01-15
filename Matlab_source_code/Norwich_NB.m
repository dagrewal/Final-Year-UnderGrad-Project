%Our training data
Norwich_NBC = [1 0 1 1 2;0 0 1 1 0;1 0 1 1 1;0 0 1 0 2;1 0 1 1 2;0 0 1 1 2;];
NorwichY = Norwich_NBC(:,5); %get our class variable
Norwich_NBC = Norwich_NBC(:,1:4)'; %features are now displayed correct way

NorwichW = NorwichY; %new array to begin first binary classification
NorwichW(NorwichW==1)=0; %change all draws to a 0
NorwichW(NorwichW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (NorwichW) / size (NorwichW,1); %get probability of a win
pNW = sum (1-NorwichW) / size (NorwichW,1); %get probability of other results

%P(x_i|Y):
phiW = Norwich_NBC * NorwichW / sum(NorwichW); %all instances where (i) = 1 and there is a win
phiNW = Norwich_NBC * (1-NorwichW) / sum(1-NorwichW); %all instances where (i) = 0 and its another result

%test point
NorwichX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNorwichXW = prod(phiW.^NorwichX.*(1-phiW).^(1-NorwichX));
pNorwichXNW = prod(phiNW.^NorwichX.*(1-phiNW).^(1-NorwichX));

%P(Y=1|X) & P(Y=0|X):
pNorwichXWF = (pNorwichXW * pW ) / (pNorwichXW + pNorwichXNW); %Y=1
pNorwichXNWF = (pNorwichXNW * pW ) / (pNorwichXW + pNorwichXNW); %Y=0

NorwichD = NorwichY; %new array to begin second binary classification
NorwichD(NorwichD==2)=0; %change all wins to a 0

pD = sum (NorwichD) / size (NorwichD,1); %probability of a draw
pND = sum (1-NorwichD) / size (NorwichD,1); %probability of not drawing

%P(x_i|Y):
phiD = Norwich_NBC * NorwichD / sum(NorwichD); %all instances where (i) = 1 and there is a win
phiND = Norwich_NBC * (1-NorwichD) / sum(1-NorwichD); %all instances where (i) = 0 and its another result

%test point
NorwichX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNorwichXD = prod(phiD.^NorwichX.*(1-phiD).^(1-NorwichX));
pNorwichXND = prod(phiND.^NorwichX.*(1-phiND).^(1-NorwichX));

%P(Y=1|X) & P(Y=0|X):
pNorwichXDF = (pNorwichXD * pD ) / (pNorwichXD + pNorwichXND); %Y=1
pNorwichXNDF = (pNorwichXND * pD ) / (pNorwichXD + pNorwichXND); %Y=0

NorwichL = NorwichY; %new array to begin second binary classification
NorwichL(NorwichL==1)=3; %change all draws to a 3
NorwichL(NorwichL==0)=1; %change all losses to a 1
NorwichL(NorwichL==2)=0; %change all wins to a 0
NorwichL(NorwichL==3)=0; %change all draws to a 0

pL = sum (NorwichL) / size (NorwichL,1); %probability of a draw
pNL = sum (1-NorwichL) / size (NorwichL,1); %probability of not drawing

%P(x_i|Y):
phiL = Norwich_NBC * NorwichL / sum(NorwichL); %all instances where (i) = 1 and there is a win
phiNL = Norwich_NBC * (1-NorwichL) / sum(1-NorwichL); %all instances where (i) = 0 and its another result

%test point
NorwichX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNorwichXL = prod(phiL.^NorwichX.*(1-phiL).^(1-NorwichX));
pNorwichXNL = prod(phiNL.^NorwichX.*(1-phiNL).^(1-NorwichX));

%P(Y=1|X) & P(Y=0|X):
pNorwichXLF = (pNorwichXL * pL ) / (pNorwichXL + pNorwichXNL); %Y=1
pNorwichXNLF = (pNorwichXNL * pL ) / (pNorwichXL + pNorwichXNL); %Y=0

%voting system chooses the probability with highest value
Win = pNorwichXW;
Draw = pNorwichXD;
Lose = pMan_UnitedXL;
Norwich_Probs = [Win, Draw, Lose];
Norwich_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Norwich_Probs);

Norwich_str = ['Arsenal vs Norwich: Arsenal will ',Norwich_Probs_name{ind}];
disp(Norwich_str)




