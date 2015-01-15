%Our training data
Man_United_NBC = [1 0 0 0 1;0 1 1 0 0;1 0 0 0 0;0 1 0 0 0;1 0 0 0 0;0 1 0 0 0;1 0 1 0 0;0 1 1 0 0;0 0 0 0 1;1 1 1 0 2;0 1 0 0 0;1 1 1 0 1;1 1 0 0 2;0 1 0 0 2;0 1 0 1 0;1 0 0 1 1;1 1 1 0 0;0 1 1 0 0;1 1 1 1 1;0 1 1 0 1;1 1 1 0 1;0 0 1 0 0;0 1 0 1 2;1 1 0 1 2;0 1 0 0 0;1 1 0 0 2;0 1 0 1 1;1 0 0 0 0;0 1 0 1 1;1 1 0 1 2;0 0 0 0 2;1 0 0 0 2;1 0 0 1 0;0 1 1 1 0;];
Man_UnitedY = Man_United_NBC(:,5); %get our class variable
Man_United_NBC = Man_United_NBC(:,1:4)'; %features are now displayed correct way

Man_UnitedW = Man_UnitedY; %new array to begin first binary classification
Man_UnitedW(Man_UnitedW==1)=0; %change all draws to a 0
Man_UnitedW(Man_UnitedW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Man_UnitedW) / size (Man_UnitedW,1); %get probability of a win
pNW = sum (1-Man_UnitedW) / size (Man_UnitedW,1); %get probability of other results

%P(x_i|Y):
phiW = Man_United_NBC * Man_UnitedW / sum(Man_UnitedW); %all instances where (i) = 1 and there is a win
phiNW = Man_United_NBC * (1-Man_UnitedW) / sum(1-Man_UnitedW); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_UnitedXW = prod(phiW.^Man_UnitedX.*(1-phiW).^(1-Man_UnitedX));
pMan_UnitedXNW = prod(phiNW.^Man_UnitedX.*(1-phiNW).^(1-Man_UnitedX));

%P(Y=1|X) & P(Y=0|X):
pMan_UnitedXWF = (pMan_UnitedXW * pW ) / (pMan_UnitedXW + pMan_UnitedXNW); %Y=1
pMan_UnitedXNWF = (pMan_UnitedXNW * pW ) / (pMan_UnitedXW + pMan_UnitedXNW); %Y=0

Man_UnitedD = Man_UnitedY; %new array to begin second binary classification
Man_UnitedD(Man_UnitedD==2)=0; %change all wins to a 0

pD = sum (Man_UnitedD) / size (Man_UnitedD,1); %probability of a draw
pND = sum (1-Man_UnitedD) / size (Man_UnitedD,1); %probability of not drawing

%P(x_i|Y):
phiD = Man_United_NBC * Man_UnitedD / sum(Man_UnitedD); %all instances where (i) = 1 and there is a win
phiND = Man_United_NBC * (1-Man_UnitedD) / sum(1-Man_UnitedD); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_UnitedXD = prod(phiD.^Man_UnitedX.*(1-phiD).^(1-Man_UnitedX));
pMan_UnitedXND = prod(phiND.^Man_UnitedX.*(1-phiND).^(1-Man_UnitedX));

%P(Y=1|X) & P(Y=0|X):
pMan_UnitedXDF = (pMan_UnitedXD * pD ) / (pMan_UnitedXD + pMan_UnitedXND); %Y=1
pMan_UnitedXNDF = (pMan_UnitedXND * pD ) / (pMan_UnitedXD + pMan_UnitedXND); %Y=0

Man_UnitedL = Man_UnitedY; %new array to begin second binary classification
Man_UnitedL(Man_UnitedL==1)=3; %change all draws to a 3
Man_UnitedL(Man_UnitedL==0)=1; %change all losses to a 1
Man_UnitedL(Man_UnitedL==2)=0; %change all wins to a 0
Man_UnitedL(Man_UnitedL==3)=0; %change all draws to a 0

pL = sum (Man_UnitedL) / size (Man_UnitedL,1); %probability of a draw
pNL = sum (1-Man_UnitedL) / size (Man_UnitedL,1); %probability of not drawing

%P(x_i|Y):
phiL = Man_United_NBC * Man_UnitedL / sum(Man_UnitedL); %all instances where (i) = 1 and there is a win
phiNL = Man_United_NBC * (1-Man_UnitedL) / sum(1-Man_UnitedL); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_UnitedXL = prod(phiL.^Man_UnitedX.*(1-phiL).^(1-Man_UnitedX));
pMan_UnitedXNL = prod(phiNL.^Man_UnitedX.*(1-phiNL).^(1-Man_UnitedX));

%P(Y=1|X) & P(Y=0|X):
pMan_UnitedXLF = (pMan_UnitedXL * pL ) / (pMan_UnitedXL + pMan_UnitedXNL); %Y=1
pMan_UnitedXNLF = (pMan_UnitedXNL * pL ) / (pMan_UnitedXL + pMan_UnitedXNL); %Y=0

%voting system chooses the probability with highest value
Win = pMan_UnitedXW;
Draw = pMan_UnitedXD;
Lose = pMan_UnitedXL;
Man_United_Probs = [Win, Draw, Lose];
Man_United_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Man_United_Probs);

Man_United_str = ['Arsenal vs Man United: Arsenal will ',Man_United_Probs_name{ind}];
disp(Man_United_str)




