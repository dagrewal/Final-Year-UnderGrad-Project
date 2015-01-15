%Our training data
Stoke_NBC = [1 0 1 0 2;0 0 0 1 1;0 0 1 1 1;1 1 1 0 2;0 0 1 1 0;1 1 1 1 2;0 0 1 0 2;1 1 1 0 2;1 0 1 1 2;0 0 1 1 0;];
StokeY = Stoke_NBC(:,5); %get our class variable
Stoke_NBC = Stoke_NBC(:,1:4)'; %features are now displayed correct way

StokeW = StokeY; %new array to begin first binary classification
StokeW(StokeW==1)=0; %change all draws to a 0
StokeW(StokeW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (StokeW) / size (StokeW,1); %get probability of a win
pNW = sum (1-StokeW) / size (StokeW,1); %get probability of other results

%P(x_i|Y):
phiW = Stoke_NBC * StokeW / sum(StokeW); %all instances where (i) = 1 and there is a win
phiNW = Stoke_NBC * (1-StokeW) / sum(1-StokeW); %all instances where (i) = 0 and its another result

%test point
StokeX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pStokeXW = prod(phiW.^StokeX.*(1-phiW).^(1-StokeX));
pStokeXNW = prod(phiNW.^StokeX.*(1-phiNW).^(1-StokeX));

%P(Y=1|X) & P(Y=0|X):
pStokeXWF = (pStokeXW * pW ) / (pStokeXW + pStokeXNW); %Y=1
pStokeXNWF = (pStokeXNW * pW ) / (pStokeXW + pStokeXNW); %Y=0

StokeD = StokeY; %new array to begin second binary classification
StokeD(StokeD==2)=0; %change all wins to a 0

pD = sum (StokeD) / size (StokeD,1); %probability of a draw
pND = sum (1-StokeD) / size (StokeD,1); %probability of not drawing

%P(x_i|Y):
phiD = Stoke_NBC * StokeD / sum(StokeD); %all instances where (i) = 1 and there is a win
phiND = Stoke_NBC * (1-StokeD) / sum(1-StokeD); %all instances where (i) = 0 and its another result

%test point
StokeX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pStokeXD = prod(phiD.^StokeX.*(1-phiD).^(1-StokeX));
pStokeXND = prod(phiND.^StokeX.*(1-phiND).^(1-StokeX));

%P(Y=1|X) & P(Y=0|X):
pStokeXDF = (pStokeXD * pD ) / (pStokeXD + pStokeXND); %Y=1
pStokeXNDF = (pStokeXND * pD ) / (pStokeXD + pStokeXND); %Y=0

StokeL = StokeY; %new array to begin second binary classification
StokeL(StokeL==1)=3; %change all draws to a 3
StokeL(StokeL==0)=1; %change all losses to a 1
StokeL(StokeL==2)=0; %change all wins to a 0
StokeL(StokeL==3)=0; %change all draws to a 0

pL = sum (StokeL) / size (StokeL,1); %probability of a draw
pNL = sum (1-StokeL) / size (StokeL,1); %probability of not drawing

%P(x_i|Y):
phiL = Stoke_NBC * StokeL / sum(StokeL); %all instances where (i) = 1 and there is a win
phiNL = Stoke_NBC * (1-StokeL) / sum(1-StokeL); %all instances where (i) = 0 and its another result

%test point
StokeX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pStokeXL = prod(phiL.^StokeX.*(1-phiL).^(1-StokeX));
pStokeXNL = prod(phiNL.^StokeX.*(1-phiNL).^(1-StokeX));

%P(Y=1|X) & P(Y=0|X):
pStokeXLF = (pStokeXL * pL ) / (pStokeXL + pStokeXNL); %Y=1
pStokeXNLF = (pStokeXNL * pL ) / (pStokeXL + pStokeXNL); %Y=0

%voting system chooses the probability with highest value
Win = pStokeXW;
Draw = pStokeXD;
Lose = pMan_UnitedXL;
Stoke_Probs = [Win, Draw, Lose];
Stoke_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Stoke_Probs);

Stoke_str = ['Arsenal vs Stoke: Arsenal will ',Stoke_Probs_name{ind}];
disp(Stoke_str)




