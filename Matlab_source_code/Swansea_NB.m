%Our training data
Swansea_NBC = [0 1 1 1 2;1 0 1 1 0;0 1 1 0 0;1 0 1 0 2;];
SwanseaY = Swansea_NBC(:,5); %get our class variable
Swansea_NBC = Swansea_NBC(:,1:4)'; %features are now displayed correct way

SwanseaW = SwanseaY; %new array to begin first binary classification
SwanseaW(SwanseaW==1)=0; %change all draws to a 0
SwanseaW(SwanseaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SwanseaW) / size (SwanseaW,1); %get probability of a win
pNW = sum (1-SwanseaW) / size (SwanseaW,1); %get probability of other results

%P(x_i|Y):
phiW = Swansea_NBC * SwanseaW / sum(SwanseaW); %all instances where (i) = 1 and there is a win
phiNW = Swansea_NBC * (1-SwanseaW) / sum(1-SwanseaW); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSwanseaXW = prod(phiW.^SwanseaX.*(1-phiW).^(1-SwanseaX));
pSwanseaXNW = prod(phiNW.^SwanseaX.*(1-phiNW).^(1-SwanseaX));

%P(Y=1|X) & P(Y=0|X):
pSwanseaXWF = (pSwanseaXW * pW ) / (pSwanseaXW + pSwanseaXNW); %Y=1
pSwanseaXNWF = (pSwanseaXNW * pW ) / (pSwanseaXW + pSwanseaXNW); %Y=0

SwanseaD = SwanseaY; %new array to begin second binary classification
SwanseaD(SwanseaD==2)=0; %change all wins to a 0

pD = sum (SwanseaD) / size (SwanseaD,1); %probability of a draw
pND = sum (1-SwanseaD) / size (SwanseaD,1); %probability of not drawing

%P(x_i|Y):
phiD = Swansea_NBC * SwanseaD / sum(SwanseaD); %all instances where (i) = 1 and there is a win
phiND = Swansea_NBC * (1-SwanseaD) / sum(1-SwanseaD); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSwanseaXD = prod(phiD.^SwanseaX.*(1-phiD).^(1-SwanseaX));
pSwanseaXND = prod(phiND.^SwanseaX.*(1-phiND).^(1-SwanseaX));

%P(Y=1|X) & P(Y=0|X):
pSwanseaXDF = (pSwanseaXD * pD ) / (pSwanseaXD + pSwanseaXND); %Y=1
pSwanseaXNDF = (pSwanseaXND * pD ) / (pSwanseaXD + pSwanseaXND); %Y=0

SwanseaL = SwanseaY; %new array to begin second binary classification
SwanseaL(SwanseaL==1)=3; %change all draws to a 3
SwanseaL(SwanseaL==0)=1; %change all losses to a 1
SwanseaL(SwanseaL==2)=0; %change all wins to a 0
SwanseaL(SwanseaL==3)=0; %change all draws to a 0

pL = sum (SwanseaL) / size (SwanseaL,1); %probability of a draw
pNL = sum (1-SwanseaL) / size (SwanseaL,1); %probability of not drawing

%P(x_i|Y):
phiL = Swansea_NBC * SwanseaL / sum(SwanseaL); %all instances where (i) = 1 and there is a win
phiNL = Swansea_NBC * (1-SwanseaL) / sum(1-SwanseaL); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSwanseaXL = prod(phiL.^SwanseaX.*(1-phiL).^(1-SwanseaX));
pSwanseaXNL = prod(phiNL.^SwanseaX.*(1-phiNL).^(1-SwanseaX));

%P(Y=1|X) & P(Y=0|X):
pSwanseaXLF = (pSwanseaXL * pL ) / (pSwanseaXL + pSwanseaXNL); %Y=1
pSwanseaXNLF = (pSwanseaXNL * pL ) / (pSwanseaXL + pSwanseaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSwanseaXW;
Draw = pSwanseaXD;
Lose = pMan_UnitedXL;
Swansea_Probs = [Win, Draw, Lose];
Swansea_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Swansea_Probs);

Swansea_str = ['Arsenal vs Swansea: Arsenal will ',Swansea_Probs_name{ind}];
disp(Swansea_str)




