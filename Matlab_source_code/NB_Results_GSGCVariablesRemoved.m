function [ NB_Results_Array_GSGC ] = NB_Results_GSGCVariablesRemoved( input_args )
%naive bayes model which doesnt onclude the goals scored and goals conceded
%variables. The concept is the same as NB_All_Variables.m except that I
%program matlab to delete the 3rd and 4th columns from feature set so that
%it removes goals scored and goals conceded.
%Our training data
Aston_Villa_NBC = [1 1 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 2 0 2;0 0 1 1 0 1 2;1 0 1 0 0 0 0;0 1 0 1 0 0 2;0 1 0 1 2 0 1;1 0 0 0 2 0 2;0 0 1 0 1 0 1;1 1 1 1 2 1 0;1 0 1 1 1 0 1;0 1 1 0 2 0 2;0 1 1 1 2 0 2;1 1 0 0 2 0 1;1 1 1 1 2 0 2;0 0 1 1 2 0 1;0 0 1 1 0 0 2;1 0 1 1 2 0 2;0 0 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 2 0 1;1 1 1 0 0 0 2;0 1 1 1 2 0 2;1 1 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 0 2 1 2;0 1 0 0 2 0 1;1 0 0 0 0 0 2;1 0 0 1 0 0 2;0 1 0 0 1 0 0;0 0 1 1 0 0 0;1 0 0 1 1 0 1;1 0 0 0 1 0 1;];
Aston_Villa_G = Aston_Villa_NBC;
Aston_Villa_G(:,3)=[];Aston_Villa_G(:,4)=[];
Aston_VillaY = Aston_Villa_G(:,5); %get our class variable
Aston_Villa_G = Aston_Villa_G(:,1:4)'; %features are now displayed correct way

Aston_VillaW = Aston_VillaY; %new array to begin first binary classification
Aston_VillaW(Aston_VillaW==1)=0; %change all draws to a 0
Aston_VillaW(Aston_VillaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Aston_VillaW) / size (Aston_VillaW,1); %get probability of a win
pNW = sum (1-Aston_VillaW) / size (Aston_VillaW,1); %get probability of other results

%P(x_i|Y):
phiW = Aston_Villa_G * Aston_VillaW / sum(Aston_VillaW); %all instances where (i) = 1 and there is a win
phiNW = Aston_Villa_G * (1-Aston_VillaW) / sum(1-Aston_VillaW); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [1 0 2 0]'; %the next game to predict

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
phiD = Aston_Villa_G * Aston_VillaD / sum(Aston_VillaD); %all instances where (i) = 1 and there is a win
phiND = Aston_Villa_G * (1-Aston_VillaD) / sum(1-Aston_VillaD); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [1 0 2 0]'; %the next game to predict

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
phiL = Aston_Villa_G * Aston_VillaL / sum(Aston_VillaL); %all instances where (i) = 1 and there is a win
phiNL = Aston_Villa_G * (1-Aston_VillaL) / sum(1-Aston_VillaL); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pAston_VillaXL = prod(phiL.^Aston_VillaX.*(1-phiL).^(1-Aston_VillaX));
pAston_VillaXNL = prod(phiNL.^Aston_VillaX.*(1-phiNL).^(1-Aston_VillaX));

%P(Y=1|X) & P(Y=0|X):
pAston_VillaXLF = (pAston_VillaXL * pL ) / (pAston_VillaXL + pAston_VillaXNL); %Y=1
pAston_VillaXNLF = (pAston_VillaXNL * pL ) / (pAston_VillaXL + pAston_VillaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pAston_VillaXWF;
Draw = pAston_VillaXDF;
Lose = pAston_VillaXLF;
Aston_Villa_Probs = [Win, Draw, Lose];
Aston_Villa_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Aston_Villa_Probs);

Aston_Villa_str = ['Arsenal vs Aston Villa: Arsenal will ',Aston_Villa_Probs_name{ind}];
disp(Aston_Villa_str)
%---------------------------------------------------------------------------------------%

%Our training data
Fulham_NBC = [0 0 1 1 1 0 2;1 1 0 1 0 1 1;0 0 1 0 2 0 0;1 1 1 0 2 0 1;0 0 1 0 0 0 1;1 1 1 1 2 0 2;1 0 1 1 0 0 2;0 1 1 0 2 0 2;1 1 1 0 1 0 1;0 0 0 1 2 0 0;0 0 1 1 1 0 2;1 0 0 0 1 0 2;1 0 1 1 1 0 2;0 0 1 1 0 0 0;0 0 1 1 0 0 2;1 0 1 1 0 1 2;1 0 1 1 2 0 2;0 0 1 1 2 0 2;0 0 1 1 1 0 2;1 1 1 1 2 0 1;1 0 1 1 1 0 2;0 1 1 1 0 0 2;1 1 1 0 2 0 2;0 1 1 1 1 0 2;];
Fulham_G = Fulham_NBC;
Fulham_G(:,3)=[];Fulham_G(:,4)=[];
FulhamY = Fulham_G(:,5); %get our class variable
Fulham_G = Fulham_G(:,1:4)'; %features are now displayed correct way

FulhamW = FulhamY; %new array to begin first binary classification
FulhamW(FulhamW==1)=0; %change all draws to a 0
FulhamW(FulhamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (FulhamW) / size (FulhamW,1); %get probability of a win
pNW = sum (1-FulhamW) / size (FulhamW,1); %get probability of other results

%P(x_i|Y):
phiW = Fulham_G * FulhamW / sum(FulhamW); %all instances where (i) = 1 and there is a win
phiNW = Fulham_G * (1-FulhamW) / sum(1-FulhamW); %all instances where (i) = 0 and its another result

%test point
FulhamX = [0 1 0 0]'; %the next game to predict

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
phiD = Fulham_G * FulhamD / sum(FulhamD); %all instances where (i) = 1 and there is a win
phiND = Fulham_G * (1-FulhamD) / sum(1-FulhamD); %all instances where (i) = 0 and its another result

%test point
FulhamX = [0 1 0 0]'; %the next game to predict

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
phiL = Fulham_G * FulhamL / sum(FulhamL); %all instances where (i) = 1 and there is a win
phiNL = Fulham_G * (1-FulhamL) / sum(1-FulhamL); %all instances where (i) = 0 and its another result

%test point
FulhamX = [0 1 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pFulhamXL = prod(phiL.^FulhamX.*(1-phiL).^(1-FulhamX));
pFulhamXNL = prod(phiNL.^FulhamX.*(1-phiNL).^(1-FulhamX));

%P(Y=1|X) & P(Y=0|X):
pFulhamXLF = (pFulhamXL * pL ) / (pFulhamXL + pFulhamXNL); %Y=1
pxFulhamXNLF = (pFulhamXNL * pL ) / (pFulhamXL + pFulhamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pFulhamXWF;
Draw = pFulhamXDF;
Lose = pFulhamXLF;
Fulham_Probs = [Win, Draw, Lose];
Fulham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Fulham_Probs);


Fulham_str = ['Arsenal vs Fulham: Arsenal will ',Fulham_Probs_name{ind}];
disp(Fulham_str)

%---------------------------------------------------------------------------------------%
%Our training data
Tottenham_NBC = [0 1 1 1 2 0 0;1 0 0 1 1 0 2;1 1 0 0 2 0 2;0 1 0 0 2 0 0;0 0 1 1 1 0 1;1 1 1 1 2 0 0;0 1 1 0 2 0 0;1 1 1 1 1 0 2;0 0 1 1 1 0 1;1 0 1 1 2 0 1;1 1 1 1 2 1 2;0 0 0 1 2 0 2;0 0 1 1 2 0 1;1 0 1 1 0 0 2;1 1 1 1 2 0 1;0 1 0 0 2 0 1;1 0 1 1 1 0 2;0 1 1 0 1 0 2;0 0 1 1 2 0 1;1 1 1 1 2 0 2;0 1 1 1 0 0 1;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 0 0 1;1 0 1 1 1 0 2;0 0 1 1 2 0 1;1 1 1 1 0 0 2;0 1 0 1 1 0 0;0 0 1 1 2 0 2;1 1 0 1 2 0 1;0 0 1 1 2 0 1;1 0 1 1 1 0 1;0 0 1 1 1 0 1;1 0 1 0 0 0 2;];
Tottenham_G = Tottenham_NBC;
Tottenham_G(:,3)=[];Tottenham_G(:,4)=[];
TottenhamY = Tottenham_G(:,5); %get our class variable
Tottenham_G = Tottenham_G(:,1:4)'; %features are now displayed correct way

TottenhamW = TottenhamY; %new array to begin first binary classification
TottenhamW(TottenhamW==1)=0; %change all draws to a 0
TottenhamW(TottenhamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (TottenhamW) / size (TottenhamW,1); %get probability of a win
pNW = sum (1-TottenhamW) / size (TottenhamW,1); %get probability of other results

%P(x_i|Y):
phiW = Tottenham_G * TottenhamW / sum(TottenhamW); %all instances where (i) = 1 and there is a win
phiNW = Tottenham_G * (1-TottenhamW) / sum(1-TottenhamW); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [1 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXW = prod(phiW.^TottenhamX.*(1-phiW).^(1-TottenhamX));
pTottenhamXNW = prod(phiNW.^TottenhamX.*(1-phiNW).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXWF = (pTottenhamXW * pW ) / (pTottenhamXW + pTottenhamXNW); %Y=1
pTottenhamXNWF = (pTottenhamXNW * pW ) / (pTottenhamXW + pTottenhamXNW); %Y=0

TottenhamD = TottenhamY; %new array to begin second binary classification
TottenhamD(TottenhamD==2)=0; %change all wins to a 0

pD = sum (TottenhamD) / size (TottenhamD,1); %probability of a draw
pND = sum (1-TottenhamD) / size (TottenhamD,1); %probability of not drawing

%P(x_i|Y):
phiD = Tottenham_G * TottenhamD / sum(TottenhamD); %all instances where (i) = 1 and there is a win
phiND = Tottenham_G * (1-TottenhamD) / sum(1-TottenhamD); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [1 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXD = prod(phiD.^TottenhamX.*(1-phiD).^(1-TottenhamX));
pTottenhamXND = prod(phiND.^TottenhamX.*(1-phiND).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXDF = (pTottenhamXD * pD ) / (pTottenhamXD + pTottenhamXND); %Y=1
pTottenhamXNDF = (pTottenhamXND * pD ) / (pTottenhamXD + pTottenhamXND); %Y=0

TottenhamL = TottenhamY; %new array to begin second binary classification
TottenhamL(TottenhamL==1)=3; %change all draws to a 3
TottenhamL(TottenhamL==0)=1; %change all losses to a 1
TottenhamL(TottenhamL==2)=0; %change all wins to a 0
TottenhamL(TottenhamL==3)=0; %change all draws to a 0

pL = sum (TottenhamL) / size (TottenhamL,1); %probability of a draw
pNL = sum (1-TottenhamL) / size (TottenhamL,1); %probability of not drawing

%P(x_i|Y):
phiL = Tottenham_G * TottenhamL / sum(TottenhamL); %all instances where (i) = 1 and there is a win
phiNL = Tottenham_G * (1-TottenhamL) / sum(1-TottenhamL); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [1 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXL = prod(phiL.^TottenhamX.*(1-phiL).^(1-TottenhamX));
pTottenhamXNL = prod(phiNL.^TottenhamX.*(1-phiNL).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXLF = (pTottenhamXL * pL ) / (pTottenhamXL + pTottenhamXNL); %Y=1
pTottenhamXNLF = (pTottenhamXNL * pL ) / (pTottenhamXL + pTottenhamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pTottenhamXWF;
Draw = pTottenhamXDF;
Lose = pTottenhamXLF;
Tottenham_Probs = [Win, Draw, Lose];
Tottenham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Tottenham_Probs);


Tottenham_str = ['Arsenal vs Tottenham: Arsenal will ',Tottenham_Probs_name{ind}];
disp(Tottenham_str)
%---------------------------------------------------------------------------------------%
%Our training data
Sunderland_NBC = [0 0 1 1 2 0 2;1 0 0 0 2 0 1;0 0 1 0 2 0 2;1 0 1 0 0 0 2;1 1 1 1 2 0 1;0 1 1 1 2 0 1;1 1 1 1 2 0 2;0 0 1 1 2 0 0;1 0 1 1 1 0 1;0 1 1 1 0 0 1;0 0 1 1 2 0 2;1 1 1 1 2 0 2;0 1 1 1 1 0 2;1 1 1 1 1 0 2;0 0 1 1 2 0 2;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 1 0 1;1 0 1 0 2 0 1;0 0 0 0 0 0 0;1 1 1 1 1 0 2;0 0 1 1 2 0 1;0 1 1 1 2 0 0;];
Sunderland_G = Sunderland_NBC;
Sunderland_G(:,3)=[];Sunderland_G(:,4)=[];
SunderlandY = Sunderland_G(:,5); %get our class variable
Sunderland_G = Sunderland_G(:,1:4)'; %features are now displayed correct way

SunderlandW = SunderlandY; %new array to begin first binary classification
SunderlandW(SunderlandW==1)=0; %change all draws to a 0
SunderlandW(SunderlandW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SunderlandW) / size (SunderlandW,1); %get probability of a win
pNW = sum (1-SunderlandW) / size (SunderlandW,1); %get probability of other results

%P(x_i|Y):
phiW = Sunderland_G * SunderlandW / sum(SunderlandW); %all instances where (i) = 1 and there is a win
phiNW = Sunderland_G * (1-SunderlandW) / sum(1-SunderlandW); %all instances where (i) = 0 and its another result

%test point
SunderlandX = [0 0 2 0]'; %the next game to predict

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
phiD = Sunderland_G * SunderlandD / sum(SunderlandD); %all instances where (i) = 1 and there is a win
phiND = Sunderland_G * (1-SunderlandD) / sum(1-SunderlandD); %all instances where (i) = 0 and its another result

%test point
SunderlandX = [0 0 2 0]'; %the next game to predict

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
phiL = Sunderland_G * SunderlandL / sum(SunderlandL); %all instances where (i) = 1 and there is a win
phiNL = Sunderland_G * (1-SunderlandL) / sum(1-SunderlandL); %all instances where (i) = 0 and its another result

%test point
SunderlandX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSunderlandXL = prod(phiL.^SunderlandX.*(1-phiL).^(1-SunderlandX));
pSunderlandXNL = prod(phiNL.^SunderlandX.*(1-phiNL).^(1-SunderlandX));

%P(Y=1|X) & P(Y=0|X):
pSunderlandXLF = (pSunderlandXL * pL ) / (pSunderlandXL + pSunderlandXNL); %Y=1
pSunderlandXNLF = (pSunderlandXNL * pL ) / (pSunderlandXL + pSunderlandXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSunderlandXWF;
Draw = pSunderlandXDF;
Lose = pSunderlandXLF;
Sunderland_Probs = [Win, Draw, Lose];
Sunderland_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Sunderland_Probs);


Sunderland_str = ['Arsenal vs Sunderland: Arsenal will ',Sunderland_Probs_name{ind}];
disp(Sunderland_str)

%---------------------------------------------------------------------------------------%
%Our training data
Stoke_NBC = [1 0 1 0 1 0 2;0 0 0 1 1 0 1;0 0 1 1 1 1 1;1 1 1 0 2 0 2;0 0 1 1 2 1 0;1 1 1 1 2 0 2;0 0 1 0 2 0 2;1 1 1 0 0 1 2;1 0 1 1 1 1 2;0 0 1 1 1 0 0;];
Stoke_G = Stoke_NBC;
Stoke_G(:,3)=[];Stoke_G(:,4)=[];
StokeY = Stoke_G(:,5); %get our class variable
Stoke_G = Stoke_G(:,1:4)'; %features are now displayed correct way

StokeW = StokeY; %new array to begin first binary classification
StokeW(StokeW==1)=0; %change all draws to a 0
StokeW(StokeW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (StokeW) / size (StokeW,1); %get probability of a win
pNW = sum (1-StokeW) / size (StokeW,1); %get probability of other results

%P(x_i|Y):
phiW = Stoke_G * StokeW / sum(StokeW); %all instances where (i) = 1 and there is a win
phiNW = Stoke_G * (1-StokeW) / sum(1-StokeW); %all instances where (i) = 0 and its another result

%test point
StokeX = [1 1 2 0]'; %the next game to predict

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
phiD = Stoke_G * StokeD / sum(StokeD); %all instances where (i) = 1 and there is a win
phiND = Stoke_G * (1-StokeD) / sum(1-StokeD); %all instances where (i) = 0 and its another result

%test point
StokeX = [1 1 2 0]'; %the next game to predict

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
phiL = Stoke_G * StokeL / sum(StokeL); %all instances where (i) = 1 and there is a win
phiNL = Stoke_G * (1-StokeL) / sum(1-StokeL); %all instances where (i) = 0 and its another result

%test point
StokeX = [1 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pStokeXL = prod(phiL.^StokeX.*(1-phiL).^(1-StokeX));
pStokeXNL = prod(phiNL.^StokeX.*(1-phiNL).^(1-StokeX));

%P(Y=1|X) & P(Y=0|X):
pStokeXLF = (pStokeXL * pL ) / (pStokeXL + pStokeXNL); %Y=1
pStokeXNLF = (pStokeXNL * pL ) / (pStokeXL + pStokeXNL); %Y=0

%voting system chooses the probability with highest value
Win = pStokeXWF;
Draw = pStokeXDF;
Lose = pStokeXLF;
Stoke_Probs = [Win, Draw, Lose];
Stoke_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Stoke_Probs);


Stoke_str = ['Arsenal vs Stoke: Arsenal will ',Stoke_Probs_name{ind}];
disp(Stoke_str)

%---------------------------------------------------------------------------------------%
%Our training data
Swansea_NBC = [0 1 1 1 0 0 2;1 0 1 1 1 0 0;0 1 1 0 0 0 0;1 0 1 0 0 1 2;];
Swansea_G = Swansea_NBC;
Swansea_G(:,3)=[];Swansea_G(:,4)=[];
SwanseaY = Swansea_G(:,5); %get our class variable
Swansea_G = Swansea_G(:,1:4)'; %features are now displayed correct way

SwanseaW = SwanseaY; %new array to begin first binary classification
SwanseaW(SwanseaW==1)=0; %change all draws to a 0
SwanseaW(SwanseaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SwanseaW) / size (SwanseaW,1); %get probability of a win
pNW = sum (1-SwanseaW) / size (SwanseaW,1); %get probability of other results

%P(x_i|Y):
phiW = Swansea_G * SwanseaW / sum(SwanseaW); %all instances where (i) = 1 and there is a win
phiNW = Swansea_G * (1-SwanseaW) / sum(1-SwanseaW); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [0 1 2 0]'; %the next game to predict

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
phiD = Swansea_G * SwanseaD / sum(SwanseaD); %all instances where (i) = 1 and there is a win
phiND = Swansea_G * (1-SwanseaD) / sum(1-SwanseaD); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [0 1 2 0]'; %the next game to predict

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
phiL = Swansea_G * SwanseaL / sum(SwanseaL); %all instances where (i) = 1 and there is a win
phiNL = Swansea_G * (1-SwanseaL) / sum(1-SwanseaL); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSwanseaXL = prod(phiL.^SwanseaX.*(1-phiL).^(1-SwanseaX));
pSwanseaXNL = prod(phiNL.^SwanseaX.*(1-phiNL).^(1-SwanseaX));

%P(Y=1|X) & P(Y=0|X):
pSwanseaXLF = (pSwanseaXL * pL ) / (pSwanseaXL + pSwanseaXNL); %Y=1
pSwanseaXNLF = (pSwanseaXNL * pL ) / (pSwanseaXL + pSwanseaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSwanseaXWF;
Draw = pSwanseaXDF;
Lose = pSwanseaXLF;
Swansea_Probs = [Win, Draw, Lose];
Swansea_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Swansea_Probs);


Swansea_str = ['Arsenal vs Swansea: Arsenal will ',Swansea_Probs_name{ind}];
disp(Swansea_str)
%---------------------------------------------------------------------------------------%
%Our training data
West_Brom_NBC = [0 0 1 1 2 0 2;1 1 0 1 0 0 2;0 0 1 1 1 0 2;1 1 1 0 2 0 2;0 1 1 1 1 0 1;1 1 1 1 1 0 0;0 0 1 1 1 0 2;1 1 0 0 2 0 2;1 0 1 1 1 0 2;0 0 1 1 2 0 0;0 0 1 1 2 0 2;1 0 1 1 2 0 1;0 0 1 1 2 0 2;1 0 1 1 1 0 2;];
West_Brom_G = West_Brom_NBC;
West_Brom_G(:,3)=[];West_Brom_G(:,4)=[];
West_BromY = West_Brom_G(:,5); %get our class variable
West_Brom_G = West_Brom_G(:,1:4)'; %features are now displayed correct way

West_BromW = West_BromY; %new array to begin first binary classification
West_BromW(West_BromW==1)=0; %change all draws to a 0
West_BromW(West_BromW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (West_BromW) / size (West_BromW,1); %get probability of a win
pNW = sum (1-West_BromW) / size (West_BromW,1); %get probability of other results

%P(x_i|Y):
phiW = West_Brom_G * West_BromW / sum(West_BromW); %all instances where (i) = 1 and there is a win
phiNW = West_Brom_G * (1-West_BromW) / sum(1-West_BromW); %all instances where (i) = 0 and its another result

%test point
West_BromX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXW = prod(phiW.^West_BromX.*(1-phiW).^(1-West_BromX));
pWest_BromXNW = prod(phiNW.^West_BromX.*(1-phiNW).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXWF = (pWest_BromXW * pW ) / (pWest_BromXW + pWest_BromXNW); %Y=1
pWest_BromXNWF = (pWest_BromXNW * pW ) / (pWest_BromXW + pWest_BromXNW); %Y=0

West_BromD = West_BromY; %new array to begin second binary classification
West_BromD(West_BromD==2)=0; %change all wins to a 0

pD = sum (West_BromD) / size (West_BromD,1); %probability of a draw
pND = sum (1-West_BromD) / size (West_BromD,1); %probability of not drawing

%P(x_i|Y):
phiD = West_Brom_G * West_BromD / sum(West_BromD); %all instances where (i) = 1 and there is a win
phiND = West_Brom_G * (1-West_BromD) / sum(1-West_BromD); %all instances where (i) = 0 and its another result

%test point
West_BromX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXD = prod(phiD.^West_BromX.*(1-phiD).^(1-West_BromX));
pWest_BromXND = prod(phiND.^West_BromX.*(1-phiND).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXDF = (pWest_BromXD * pD ) / (pWest_BromXD + pWest_BromXND); %Y=1
pWest_BromXNDF = (pWest_BromXND * pD ) / (pWest_BromXD + pWest_BromXND); %Y=0

West_BromL = West_BromY; %new array to begin second binary classification
West_BromL(West_BromL==1)=3; %change all draws to a 3
West_BromL(West_BromL==0)=1; %change all losses to a 1
West_BromL(West_BromL==2)=0; %change all wins to a 0
West_BromL(West_BromL==3)=0; %change all draws to a 0

pL = sum (West_BromL) / size (West_BromL,1); %probability of a draw
pNL = sum (1-West_BromL) / size (West_BromL,1); %probability of not drawing

%P(x_i|Y):
phiL = West_Brom_G * West_BromL / sum(West_BromL); %all instances where (i) = 1 and there is a win
phiNL = West_Brom_G * (1-West_BromL) / sum(1-West_BromL); %all instances where (i) = 0 and its another result

%test point
West_BromX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXL = prod(phiL.^West_BromX.*(1-phiL).^(1-West_BromX));
pWest_BromXNL = prod(phiNL.^West_BromX.*(1-phiNL).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXLF = (pWest_BromXL * pL ) / (pWest_BromXL + pWest_BromXNL); %Y=1
pWest_BromXNLF = (pWest_BromXNL * pL ) / (pWest_BromXL + pWest_BromXNL); %Y=0

%voting system chooses the probability with highest value
Win = pWest_BromXWF;
Draw = pWest_BromXDF;
Lose = pWest_BromXLF;
West_Brom_Probs = [Win, Draw, Lose];
West_Brom_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(West_Brom_Probs);


West_Brom_str = ['Arsenal vs West Brom: Arsenal will ',West_Brom_Probs_name{ind}];
disp(West_Brom_str)
%---------------------------------------------------------------------------------------%
%Our training data
Norwich_NBC = [1 0 1 1 2 0 2;0 0 1 1 2 0 0;1 0 1 1 1 0 1;0 0 1 0 2 0 2;1 0 1 1 2 0 2;0 0 1 1 2 0 2;];
Norwich_G = Norwich_NBC;
Norwich_G(:,3) = [];Norwich_G(:,4) = [];
NorwichY = Norwich_G(:,5); %get our class variable
Norwich_G = Norwich_G(:,1:4)'; %features are now displayed correct way

NorwichW = NorwichY; %new array to begin first binary classification
NorwichW(NorwichW==1)=0; %change all draws to a 0
NorwichW(NorwichW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (NorwichW) / size (NorwichW,1); %get probability of a win
pNW = sum (1-NorwichW) / size (NorwichW,1); %get probability of other results

%P(x_i|Y):
phiW = Norwich_G * NorwichW / sum(NorwichW); %all instances where (i) = 1 and there is a win
phiNW = Norwich_G * (1-NorwichW) / sum(1-NorwichW); %all instances where (i) = 0 and its another result

%test point
NorwichX = [1 0 1 0]'; %the next game to predict

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
phiD = Norwich_G * NorwichD / sum(NorwichD); %all instances where (i) = 1 and there is a win
phiND = Norwich_G * (1-NorwichD) / sum(1-NorwichD); %all instances where (i) = 0 and its another result

%test point
NorwichX = [1 0 1 0]'; %the next game to predict

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
phiL = Norwich_G * NorwichL / sum(NorwichL); %all instances where (i) = 1 and there is a win
phiNL = Norwich_G * (1-NorwichL) / sum(1-NorwichL); %all instances where (i) = 0 and its another result

%test point
NorwichX = [1 0 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNorwichXL = prod(phiL.^NorwichX.*(1-phiL).^(1-NorwichX));
pNorwichXNL = prod(phiNL.^NorwichX.*(1-phiNL).^(1-NorwichX));

%P(Y=1|X) & P(Y=0|X):
pNorwichXLF = (pNorwichXL * pL ) / (pNorwichXL + pNorwichXNL); %Y=1
pNorwichXNLF = (pNorwichXNL * pL ) / (pNorwichXL + pNorwichXNL); %Y=0

%voting system chooses the probability with highest value
Win = pNorwichXWF;
Draw = pNorwichXDF;
Lose = pNorwichXLF;
Norwich_Probs = [Win, Draw, Lose];
Norwich_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Norwich_Probs);


Norwich_str = ['Arsenal vs Norwich: Arsenal will ',Norwich_Probs_name{ind}];
disp(Norwich_str)
%---------------------------------------------------------------------------------------%
%Our training data
Liverpool_NBC = [1 1 1 1 2 0 1;0 0 0 1 1 0 2;0 0 1 0 2 0 2;1 1 0 1 1 0 0;1 0 1 1 2 0 1;0 0 0 0 2 0 1;1 0 1 0 0 1 2;0 1 1 1 2 0 2;0 1 0 0 2 0 1;1 0 1 0 1 0 1;1 1 1 0 2 0 1;0 1 1 0 2 0 1;0 0 1 0 0 0 0;1 1 1 1 0 0 2;1 1 1 0 2 0 2;0 0 1 0 1 0 0;1 0 1 1 2 0 2;0 1 1 0 1 0 0;1 1 1 1 1 0 2;0 1 1 1 2 0 2;0 1 1 0 2 0 1;1 0 1 0 2 0 1;1 1 1 0 0 0 1;0 0 1 0 1 0 2;0 0 0 1 0 0 0;1 0 0 0 0 0 0;1 0 1 0 2 0 0;0 0 1 0 2 0 0;1 1 0 1 2 0 1;0 0 0 0 2 0 1;0 0 1 1 2 0 0;1 0 1 0 0 0 0;1 0 0 0 2 0 0;];
Liverpool_G = Liverpool_NBC;
Liverpool_G(:,3)=[];Liverpool_G(:,4)=[];
LiverpoolY = Liverpool_G(:,5); %get our class variable
Liverpool_G = Liverpool_G(:,1:4)'; %features are now displayed correct way

LiverpoolW = LiverpoolY; %new array to begin first binary classification
LiverpoolW(LiverpoolW==1)=0; %change all draws to a 0
LiverpoolW(LiverpoolW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (LiverpoolW) / size (LiverpoolW,1); %get probability of a win
pNW = sum (1-LiverpoolW) / size (LiverpoolW,1); %get probability of other results

%P(x_i|Y):
phiW = Liverpool_G * LiverpoolW / sum(LiverpoolW); %all instances where (i) = 1 and there is a win
phiNW = Liverpool_G * (1-LiverpoolW) / sum(1-LiverpoolW); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [1 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXW = prod(phiW.^LiverpoolX.*(1-phiW).^(1-LiverpoolX));
pLiverpoolXNW = prod(phiNW.^LiverpoolX.*(1-phiNW).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pLiverpoolXWF = (pLiverpoolXW * pW ) / (pLiverpoolXW + pLiverpoolXNW); %Y=1
pLiverpoolXNWF = (pLiverpoolXNW * pW ) / (pLiverpoolXW + pLiverpoolXNW); %Y=0

LiverpoolD = LiverpoolY; %new array to begin second binary classification
LiverpoolD(LiverpoolD==2)=0; %change all wins to a 0

pD = sum (LiverpoolD) / size (LiverpoolD,1); %probability of a draw
pND = sum (1-LiverpoolD) / size (LiverpoolD,1); %probability of not drawing

%P(x_i|Y):
phiD = Liverpool_G * LiverpoolD / sum(LiverpoolD); %all instances where (i) = 1 and there is a win
phiND = Liverpool_G * (1-LiverpoolD) / sum(1-LiverpoolD); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [1 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXD = prod(phiD.^LiverpoolX.*(1-phiD).^(1-LiverpoolX));
pLiverpoolXND = prod(phiND.^LiverpoolX.*(1-phiND).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pLiverpoolXDF = (pLiverpoolXD * pD ) / (pLiverpoolXD + pLiverpoolXND); %Y=1
pLiverpoolXNDF = (pLiverpoolXND * pD ) / (pLiverpoolXD + pLiverpoolXND); %Y=0

LiverpoolL = LiverpoolY; %new array to begin second binary classification
LiverpoolL(LiverpoolL==1)=3; %change all draws to a 3
LiverpoolL(LiverpoolL==0)=1; %change all losses to a 1
LiverpoolL(LiverpoolL==2)=0; %change all wins to a 0
LiverpoolL(LiverpoolL==3)=0; %change all draws to a 0

pL = sum (LiverpoolL) / size (LiverpoolL,1); %probability of a draw
pNL = sum (1-LiverpoolL) / size (LiverpoolL,1); %probability of not drawing

%P(x_i|Y):
phiL = Liverpool_G * LiverpoolL / sum(LiverpoolL); %all instances where (i) = 1 and there is a win
phiNL = Liverpool_G * (1-LiverpoolL) / sum(1-LiverpoolL); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [1 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXL = prod(phiL.^LiverpoolX.*(1-phiL).^(1-LiverpoolX));
pLiverpoolXNL = prod(phiNL.^LiverpoolX.*(1-phiNL).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pLiverpoolXLF = (pLiverpoolXL * pL ) / (pLiverpoolXL + pLiverpoolXNL); %Y=1
pLiverpoolXNLF = (pLiverpoolXNL * pL ) / (pLiverpoolXL + pLiverpoolXNL); %Y=0

%voting system chooses the probability with highest value
Win = pLiverpoolXWF;
Draw = pLiverpoolXDF;
Lose = pLiverpoolXLF;
Liverpool_Probs = [Win, Draw, Lose];
Liverpool_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Liverpool_Probs);


Liverpool_str = ['Arsenal vs Liverpool: Arsenal will ',Liverpool_Probs_name{ind}];
disp(Liverpool_str)
%---------------------------------------------------------------------------------------%
%Our training data
Man_United_NBC = [1 0 0 0 2 0 1;0 1 1 0 2 0 0;1 0 0 0 0 0 0;0 1 0 0 0 0 0;1 0 0 0 0 0 0;0 1 0 0 2 0 0;1 0 1 0 1 0 0;0 1 1 0 2 0 0;0 0 0 0 0 1 1;1 1 1 0 0 0 2;0 1 0 0 1 0 0;1 1 1 0 1 0 1;1 1 0 0 2 0 2;0 1 0 0 1 0 2;0 1 0 1 2 0 0;1 0 0 1 1 0 1;1 1 1 0 2 0 0;0 1 1 0 2 0 0;1 1 1 1 2 0 1;0 1 1 0 1 0 1;1 1 1 0 1 0 1;0 0 1 0 2 0 0;0 1 0 1 2 0 2;1 1 0 1 1 0 2;0 1 0 0 2 0 0;1 1 0 0 1 0 2;0 1 0 1 2 0 1;1 0 0 0 1 0 0;0 1 0 1 2 0 1;1 1 0 1 1 0 2;0 0 0 0 2 0 2;1 0 0 0 0 0 2;1 0 0 1 1 0 0;0 1 1 1 1 0 0;];
Man_United_G = Man_United_NBC;
Man_United_G(:,3)=[];Man_United_G(:,4)=[];
Man_UnitedY = Man_United_G(:,5); %get our class variable
Man_United_G = Man_United_G(:,1:4)'; %features are now displayed correct way

Man_UnitedW = Man_UnitedY; %new array to begin first binary classification
Man_UnitedW(Man_UnitedW==1)=0; %change all draws to a 0
Man_UnitedW(Man_UnitedW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Man_UnitedW) / size (Man_UnitedW,1); %get probability of a win
pNW = sum (1-Man_UnitedW) / size (Man_UnitedW,1); %get probability of other results

%P(x_i|Y):
phiW = Man_United_G * Man_UnitedW / sum(Man_UnitedW); %all instances where (i) = 1 and there is a win
phiNW = Man_United_G * (1-Man_UnitedW) / sum(1-Man_UnitedW); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [0 1 2 0]'; %the next game to predict

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
phiD = Man_United_G * Man_UnitedD / sum(Man_UnitedD); %all instances where (i) = 1 and there is a win
phiND = Man_United_G * (1-Man_UnitedD) / sum(1-Man_UnitedD); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [0 1 2 0]'; %the next game to predict

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
phiL = Man_United_G * Man_UnitedL / sum(Man_UnitedL); %all instances where (i) = 1 and there is a win
phiNL = Man_United_G * (1-Man_UnitedL) / sum(1-Man_UnitedL); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_UnitedXL = prod(phiL.^Man_UnitedX.*(1-phiL).^(1-Man_UnitedX));
pMan_UnitedXNL = prod(phiNL.^Man_UnitedX.*(1-phiNL).^(1-Man_UnitedX));

%P(Y=1|X) & P(Y=0|X):
pMan_UnitedXLF = (pMan_UnitedXL * pL ) / (pMan_UnitedXL + pMan_UnitedXNL); %Y=1
pMan_UnitedXNLF = (pMan_UnitedXNL * pL ) / (pMan_UnitedXL + pMan_UnitedXNL); %Y=0

%voting system chooses the probability with highest value
Win = pMan_UnitedXWF;
Draw = pMan_UnitedXDF;
Lose = pMan_UnitedXLF;
Man_United_Probs = [Win, Draw, Lose];
Man_United_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Man_United_Probs);


Man_United_str = ['Arsenal vs Man United: Arsenal will ',Man_United_Probs_name{ind}];
disp(Man_United_str)
%---------------------------------------------------------------------------------------%
%Our training data
Southampton_NBC = [0 0 1 1 2 0 1;1 0 0 1 2 0 2;0 1 1 1 2 0 1;1 1 1 1 0 0 1;1 0 1 1 2 0 2;0 0 1 1 2 0 2;1 0 1 0 0 0 2;0 0 1 1 2 0 0;1 0 1 1 2 0 1;0 0 1 1 2 0 2;0 0 1 1 1 0 0;1 0 1 1 0 0 2;1 0 1 1 0 0 2;0 1 0 1 2 0 2;0 0 1 1 2 0 1;1 0 1 1 2 0 1;1 1 1 1 1 0 2;0 0 1 1 2 0 2;0 0 1 1 2 0 2;1 0 1 1 2 1 2;];
Southampton_G = Southampton_NBC;
Southampton_G(:,3)=[];Southampton_G(:,4)=[];
SouthamptonY = Southampton_G(:,5); %get our class variable
Southampton_G = Southampton_G(:,1:4)'; %features are now displayed correct way

SouthamptonW = SouthamptonY; %new array to begin first binary classification
SouthamptonW(SouthamptonW==1)=0; %change all draws to a 0
SouthamptonW(SouthamptonW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SouthamptonW) / size (SouthamptonW,1); %get probability of a win
pNW = sum (1-SouthamptonW) / size (SouthamptonW,1); %get probability of other results

%P(x_i|Y):
phiW = Southampton_G * SouthamptonW / sum(SouthamptonW); %all instances where (i) = 1 and there is a win
phiNW = Southampton_G * (1-SouthamptonW) / sum(1-SouthamptonW); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [1 0 0 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXW = prod(phiW.^SouthamptonX.*(1-phiW).^(1-SouthamptonX));
pSouthamptonXNW = prod(phiNW.^SouthamptonX.*(1-phiNW).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXWF = (pSouthamptonXW * pW ) / (pSouthamptonXW + pSouthamptonXNW); %Y=1
pSouthamptonXNWF = (pSouthamptonXNW * pW ) / (pSouthamptonXW + pSouthamptonXNW); %Y=0

SouthamptonD = SouthamptonY; %new array to begin second binary classification
SouthamptonD(SouthamptonD==2)=0; %change all wins to a 0

pD = sum (SouthamptonD) / size (SouthamptonD,1); %probability of a draw
pND = sum (1-SouthamptonD) / size (SouthamptonD,1); %probability of not drawing

%P(x_i|Y):
phiD = Southampton_G * SouthamptonD / sum(SouthamptonD); %all instances where (i) = 1 and there is a win
phiND = Southampton_G * (1-SouthamptonD) / sum(1-SouthamptonD); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [1 0 0 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXD = prod(phiD.^SouthamptonX.*(1-phiD).^(1-SouthamptonX));
pSouthamptonXND = prod(phiND.^SouthamptonX.*(1-phiND).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXDF = (pSouthamptonXD * pD ) / (pSouthamptonXD + pSouthamptonXND); %Y=1
pSouthamptonXNDF = (pSouthamptonXND * pD ) / (pSouthamptonXD + pSouthamptonXND); %Y=0

SouthamptonL = SouthamptonY; %new array to begin second binary classification
SouthamptonL(SouthamptonL==1)=3; %change all draws to a 3
SouthamptonL(SouthamptonL==0)=1; %change all losses to a 1
SouthamptonL(SouthamptonL==2)=0; %change all wins to a 0
SouthamptonL(SouthamptonL==3)=0; %change all draws to a 0

pL = sum (SouthamptonL) / size (SouthamptonL,1); %probability of a draw
pNL = sum (1-SouthamptonL) / size (SouthamptonL,1); %probability of not drawing

%P(x_i|Y):
phiL = Southampton_G * SouthamptonL / sum(SouthamptonL); %all instances where (i) = 1 and there is a win
phiNL = Southampton_G * (1-SouthamptonL) / sum(1-SouthamptonL); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [1 0 0 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXL = prod(phiL.^SouthamptonX.*(1-phiL).^(1-SouthamptonX));
pSouthamptonXNL = prod(phiNL.^SouthamptonX.*(1-phiNL).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXLF = (pSouthamptonXL * pL ) / (pSouthamptonXL + pSouthamptonXNL); %Y=1
pSouthamptonXNLF = (pSouthamptonXNL * pL ) / (pSouthamptonXL + pSouthamptonXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSouthamptonXWF;
Draw = pSouthamptonXDF;
Lose = pSouthamptonXLF;
Southampton_Probs = [Win, Draw, Lose];
Southampton_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Southampton_Probs);


Southampton_str = ['Arsenal vs Southampton: Arsenal will ',Southampton_Probs_name{ind}];
disp(Southampton_str)
%---------------------------------------------------------------------------------------%
%Our training data
Hull_NBC = [0 1 1 1 2 0 2;1 0 1 1 1 0 2;0 0 1 1 2 0 2;1 1 1 1 2 0 0;];
Hull_G = Hull_NBC;
Hull_G(:,3)=[];Hull_G(:,4)=[];
HullY = Hull_G(:,5); %get our class variable
Hull_G = Hull_G(:,1:4)'; %features are now displayed correct way

HullW = HullY; %new array to begin first binary classification
HullW(HullW==1)=0; %change all draws to a 0
HullW(HullW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (HullW) / size (HullW,1); %get probability of a win
pNW = sum (1-HullW) / size (HullW,1); %get probability of other results

%P(x_i|Y):
phiW = Hull_G * HullW / sum(HullW); %all instances where (i) = 1 and there is a win
phiNW = Hull_G * (1-HullW) / sum(1-HullW); %all instances where (i) = 0 and its another result

%test point
HullX = [1 0 2 0]'; %the next game to predict

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
phiD = Hull_G * HullD / sum(HullD); %all instances where (i) = 1 and there is a win
phiND = Hull_G * (1-HullD) / sum(1-HullD); %all instances where (i) = 0 and its another result

%test point
HullX = [1 0 2 0]'; %the next game to predict

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
phiL = Hull_G * HullL / sum(HullL); %all instances where (i) = 1 and there is a win
phiNL = Hull_G * (1-HullL) / sum(1-HullL); %all instances where (i) = 0 and its another result

%test point
HullX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pHullXL = prod(phiL.^HullX.*(1-phiL).^(1-HullX));
pHullXNL = prod(phiNL.^HullX.*(1-phiNL).^(1-HullX));

%P(Y=1|X) & P(Y=0|X):
pHullXLF = (pHullXL * pL ) / (pHullXL + pHullXNL); %Y=1
pHullXNLF = (pHullXNL * pL ) / (pHullXL + pHullXNL); %Y=0

%voting system chooses the probability with highest value
Win = pHullXWF;
Draw = pHullXDF;
Lose = pHullXLF;
Hull_Probs = [Win, Draw, Lose];
Hull_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Hull_Probs);


Hull_str = ['Arsenal vs Hull: Arsenal will ',Hull_Probs_name{ind}];
disp(Hull_str)
%---------------------------------------------------------------------------------------%
%Our training data
Everton_NBC = [0 0 1 1 2 0 1;1 0 0 1 1 0 1;0 0 1 0 2 0 2;1 1 1 0 2 0 2;1 1 1 1 2 0 2;0 0 1 0 2 0 2;1 1 1 1 2 0 1;0 0 0 0 2 0 2;0 1 1 1 2 0 1;1 0 1 1 1 0 2;1 0 1 0 2 0 2;0 0 1 1 1 0 2;0 0 1 1 2 0 0;1 1 0 1 0 0 1;0 1 1 1 2 0 0;1 1 1 0 0 0 2;1 0 1 1 2 0 2;0 1 0 0 2 0 2;0 1 1 1 2 0 1;1 0 0 0 2 0 2;1 1 1 1 0 0 2;0 0 1 1 2 0 0;1 0 1 1 2 1 2;0 0 1 1 1 0 2;1 1 1 1 0 0 2;0 0 1 1 1 0 0;0 0 1 1 2 0 2;1 1 0 1 0 0 2;0 0 1 1 2 0 2;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 0 1 1 2 0 1;0 0 1 1 0 0 2;1 1 1 1 0 0 2;];
Everton_G = Everton_NBC;
Everton_G(:,3)=[];Everton_G(:,4)=[];
EvertonY = Everton_G(:,5); %get our class variable
Everton_G = Everton_G(:,1:4)'; %features are now displayed correct way

EvertonW = EvertonY; %new array to begin first binary classification
EvertonW(EvertonW==1)=0; %change all draws to a 0
EvertonW(EvertonW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (EvertonW) / size (EvertonW,1); %get probability of a win
pNW = sum (1-EvertonW) / size (EvertonW,1); %get probability of other results

%P(x_i|Y):
phiW = Everton_G * EvertonW / sum(EvertonW); %all instances where (i) = 1 and there is a win
phiNW = Everton_G * (1-EvertonW) / sum(1-EvertonW); %all instances where (i) = 0 and its another result

%test point
EvertonX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXW = prod(phiW.^EvertonX.*(1-phiW).^(1-EvertonX));
pEvertonXNW = prod(phiNW.^EvertonX.*(1-phiNW).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXWF = (pEvertonXW * pW ) / (pEvertonXW + pEvertonXNW); %Y=1
pxEvertonXNWF = (pEvertonXNW * pW ) / (pEvertonXW + pEvertonXNW); %Y=0

EvertonD = EvertonY; %new array to begin second binary classification
EvertonD(EvertonD==2)=0; %change all wins to a 0

pD = sum (EvertonD) / size (EvertonD,1); %probability of a draw
pND = sum (1-EvertonD) / size (EvertonD,1); %probability of not drawing

%P(x_i|Y):
phiD = Everton_G * EvertonD / sum(EvertonD); %all instances where (i) = 1 and there is a win
phiND = Everton_G * (1-EvertonD) / sum(1-EvertonD); %all instances where (i) = 0 and its another result

%test point
EvertonX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXD = prod(phiD.^EvertonX.*(1-phiD).^(1-EvertonX));
pEvertonXND = prod(phiND.^EvertonX.*(1-phiND).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXDF = (pEvertonXD * pD ) / (pEvertonXD + pEvertonXND); %Y=1
pEvertonXNDF = (pEvertonXND * pD ) / (pEvertonXD + pEvertonXND); %Y=0

EvertonL = EvertonY; %new array to begin second binary classification
EvertonL(EvertonL==1)=3; %change all draws to a 3
EvertonL(EvertonL==0)=1; %change all losses to a 1
EvertonL(EvertonL==2)=0; %change all wins to a 0
EvertonL(EvertonL==3)=0; %change all draws to a 0

pL = sum (EvertonL) / size (EvertonL,1); %probability of a draw
pNL = sum (1-EvertonL) / size (EvertonL,1); %probability of not drawing

%P(x_i|Y):
phiL = Everton_G * EvertonL / sum(EvertonL); %all instances where (i) = 1 and there is a win
phiNL = Everton_G * (1-EvertonL) / sum(1-EvertonL); %all instances where (i) = 0 and its another result

%test point
EvertonX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXL = prod(phiL.^EvertonX.*(1-phiL).^(1-EvertonX));
pEvertonXNL = prod(phiNL.^EvertonX.*(1-phiNL).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXLF = (pEvertonXL * pL ) / (pEvertonXL + pEvertonXNL); %Y=1
pxEvertonXNLF = (pEvertonXNL * pL ) / (pEvertonXL + pEvertonXNL); %Y=0

%voting system chooses the probability with highest value
Win = pEvertonXWF;
Draw = pEvertonXDF;
Lose = pEvertonXLF;
Everton_Probs = [Win, Draw, Lose];
Everton_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Everton_Probs);


Everton_str = ['Arsenal vs Everton: Arsenal will ',Everton_Probs_name{ind}];
disp(Everton_str)
%---------------------------------------------------------------------------------------%
%Our training data
Man_City_NBC = [1 1 0 0 1 0 0;0 1 0 1 2 0 1;1 0 0 0 0 0 2;0 0 0 0 2 0 0;1 0 1 0 2 0 1;0 1 1 0 2 0 2;1 0 1 1 0 0 1;0 0 1 0 0 1 0;1 0 1 1 2 0 2;0 0 0 1 0 0 0;0 0 1 1 2 0 2;1 0 0 0 1 0 2;1 0 1 1 2 0 2;0 1 0 1 1 0 0;0 0 1 1 2 0 2;1 1 0 1 0 0 2;1 0 1 0 2 0 1;0 0 1 0 1 0 2;1 1 1 1 2 0 2;0 0 1 1 2 0 2;0 1 1 1 1 0 2;1 0 1 0 1 0 2;0 1 1 1 2 0 2;1 1 1 1 2 0 2;];
Man_City_G = Man_City_NBC;
Man_City_G(:,3)=[];Man_City_G(:,4)=[];
Man_CityY = Man_City_G(:,5); %get our class variable
Man_City_G = Man_City_G(:,1:4)'; %features are now displayed correct way

Man_CityW = Man_CityY; %new array to begin first binary classification
Man_CityW(Man_CityW==1)=0; %change all draws to a 0
Man_CityW(Man_CityW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Man_CityW) / size (Man_CityW,1); %get probability of a win
pNW = sum (1-Man_CityW) / size (Man_CityW,1); %get probability of other results

%P(x_i|Y):
phiW = Man_City_G * Man_CityW / sum(Man_CityW); %all instances where (i) = 1 and there is a win
phiNW = Man_City_G * (1-Man_CityW) / sum(1-Man_CityW); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [0 1 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_CityXW = prod(phiW.^Man_CityX.*(1-phiW).^(1-Man_CityX));
pMan_CityXNW = prod(phiNW.^Man_CityX.*(1-phiNW).^(1-Man_CityX));

%P(Y=1|X) & P(Y=0|X):
pMan_CityXWF = (pMan_CityXW * pW ) / (pMan_CityXW + pMan_CityXNW); %Y=1
pMan_CityXNWF = (pMan_CityXNW * pW ) / (pMan_CityXW + pMan_CityXNW); %Y=0

Man_CityD = Man_CityY; %new array to begin second binary classification
Man_CityD(Man_CityD==2)=0; %change all wins to a 0

pD = sum (Man_CityD) / size (Man_CityD,1); %probability of a draw
pND = sum (1-Man_CityD) / size (Man_CityD,1); %probability of not drawing

%P(x_i|Y):
phiD = Man_City_G * Man_CityD / sum(Man_CityD); %all instances where (i) = 1 and there is a win
phiND = Man_City_G * (1-Man_CityD) / sum(1-Man_CityD); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [0 1 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_CityXD = prod(phiD.^Man_CityX.*(1-phiD).^(1-Man_CityX));
pMan_CityXND = prod(phiND.^Man_CityX.*(1-phiND).^(1-Man_CityX));

%P(Y=1|X) & P(Y=0|X):
pMan_CityXDF = (pMan_CityXD * pD ) / (pMan_CityXD + pMan_CityXND); %Y=1
pMan_CityXNDF = (pMan_CityXND * pD ) / (pMan_CityXD + pMan_CityXND); %Y=0

Man_CityL = Man_CityY; %new array to begin second binary classification
Man_CityL(Man_CityL==1)=3; %change all draws to a 3
Man_CityL(Man_CityL==0)=1; %change all losses to a 1
Man_CityL(Man_CityL==2)=0; %change all wins to a 0
Man_CityL(Man_CityL==3)=0; %change all draws to a 0

pL = sum (Man_CityL) / size (Man_CityL,1); %probability of a draw
pNL = sum (1-Man_CityL) / size (Man_CityL,1); %probability of not drawing

%P(x_i|Y):
phiL = Man_City_G * Man_CityL / sum(Man_CityL); %all instances where (i) = 1 and there is a win
phiNL = Man_City_G * (1-Man_CityL) / sum(1-Man_CityL); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [0 1 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_CityXL = prod(phiL.^Man_CityX.*(1-phiL).^(1-Man_CityX));
pMan_CityXNL = prod(phiNL.^Man_CityX.*(1-phiNL).^(1-Man_CityX));

%P(Y=1|X) & P(Y=0|X):
pMan_CityXLF = (pMan_CityXL * pL ) / (pMan_CityXL + pMan_CityXNL); %Y=1
pMan_CityXNLF = (pMan_CityXNL * pL ) / (pMan_CityXL + pMan_CityXNL); %Y=0

%voting system chooses the probability with highest value
Win = pMan_CityXWF;
Draw = pMan_CityXDF;
Lose = pMan_CityXLF;
Man_City_Probs = [Win, Draw, Lose];
Man_City_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Man_City_Probs);


Man_City_str = ['Arsenal vs Man City: Arsenal will ',Man_City_Probs_name{ind}];
disp(Man_City_str)
%---------------------------------------------------------------------------------------%
%Our training data
Chelsea_NBC = [0 1 0 0 0 1 0;1 1 0 0 1 1 0;1 0 1 0 0 0 1;0 1 0 0 2 0 2;1 0 1 0 0 1 2;0 1 0 0 0 0 0;0 0 1 0 0 1 0;1 1 1 0 0 0 0;1 1 1 0 2 0 0;0 1 0 0 0 0 0;0 0 1 0 1 0 0;1 1 1 0 0 0 2;1 0 0 0 2 0 1;0 1 0 0 2 0 1;1 0 0 0 0 0 0;0 0 1 0 2 0 0;0 1 1 0 2 0 1;1 1 1 0 2 0 1;0 1 1 1 2 0 2;1 0 0 1 2 0 2;1 0 1 0 1 0 2;0 0 1 1 2 0 1;1 0 1 0 2 0 2;0 0 1 0 2 0 1;1 1 0 1 0 0 1;0 0 1 1 2 0 1;1 0 1 1 2 0 2;0 1 1 0 2 0 2;1 1 0 1 2 0 2;0 0 0 1 1 0 1;1 0 0 0 2 0 2;0 1 0 0 2 0 2;0 0 1 1 0 0 2;];
Chelsea_G = Chelsea_NBC;
Chelsea_G(:,3)=[];Chelsea_G(:,4)=[];
ChelseaY = Chelsea_G(:,5); %get our class variable
Chelsea_G = Chelsea_G(:,1:4)'; %features are now displayed correct way

ChelseaW = ChelseaY; %new array to begin first binary classification
ChelseaW(ChelseaW==1)=0; %change all draws to a 0
ChelseaW(ChelseaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (ChelseaW) / size (ChelseaW,1); %get probability of a win
pNW = sum (1-ChelseaW) / size (ChelseaW,1); %get probability of other results

%P(x_i|Y):
phiW = Chelsea_G * ChelseaW / sum(ChelseaW); %all instances where (i) = 1 and there is a win
phiNW = Chelsea_G * (1-ChelseaW) / sum(1-ChelseaW); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [1 0 0 1]'; %the next game to predict

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
phiD = Chelsea_G * ChelseaD / sum(ChelseaD); %all instances where (i) = 1 and there is a win
phiND = Chelsea_G * (1-ChelseaD) / sum(1-ChelseaD); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [1 0 0 1]'; %the next game to predict

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
phiL = Chelsea_G * ChelseaL / sum(ChelseaL); %all instances where (i) = 1 and there is a win
phiNL = Chelsea_G * (1-ChelseaL) / sum(1-ChelseaL); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [1 0 0 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pChelseaXL = prod(phiL.^ChelseaX.*(1-phiL).^(1-ChelseaX));
pChelseaXNL = prod(phiNL.^ChelseaX.*(1-phiNL).^(1-ChelseaX));

%P(Y=1|X) & P(Y=0|X):
pChelseaXLF = (pChelseaXL * pL ) / (pChelseaXL + pChelseaXNL); %Y=1
pxChelseaXNLF = (pChelseaXNL * pL ) / (pChelseaXL + pChelseaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pChelseaXWF;
Draw = pChelseaXDF;
Lose = pChelseaXLF;
Chelsea_Probs = [Win, Draw, Lose];
Chelsea_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Chelsea_Probs);


Chelsea_str = ['Arsenal vs Chelsea: Arsenal will ',Chelsea_Probs_name{ind}];
disp(Chelsea_str)
%---------------------------------------------------------------------------------------%
%Our training data
West_Ham_NBC = [1 0 1 1 0 0 2;0 1 1 1 0 0 2;0 1 1 1 1 0 2;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 1 0 1;0 1 1 1 1 0 2;1 0 1 1 2 0 2;0 1 1 1 2 0 2;1 0 1 1 2 0 0;0 1 1 1 1 0 0;1 1 1 1 0 0 0;0 0 0 0 2 0 1;1 0 1 1 0 0 2;0 0 1 1 2 0 1;1 0 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 2 0 2;0 1 1 1 2 0 2;1 0 1 1 0 1 2;0 1 1 0 2 0 0;0 0 0 1 2 0 2;1 0 0 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 2 0 2;0 0 1 1 2 0 2;0 0 1 1 2 0 2;];
West_Ham_G = West_Ham_NBC;
West_Ham_G(:,3)=[];West_Ham_G(:,4)=[];
West_HamY = West_Ham_G(:,5); %get our class variable
West_Ham_G = West_Ham_G(:,1:4)'; %features are now displayed correct way

West_HamW = West_HamY; %new array to begin first binary classification
West_HamW(West_HamW==1)=0; %change all draws to a 0
West_HamW(West_HamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (West_HamW) / size (West_HamW,1); %get probability of a win
pNW = sum (1-West_HamW) / size (West_HamW,1); %get probability of other results

%P(x_i|Y):
phiW = West_Ham_G * West_HamW / sum(West_HamW); %all instances where (i) = 1 and there is a win
phiNW = West_Ham_G * (1-West_HamW) / sum(1-West_HamW); %all instances where (i) = 0 and its another result

%test point
West_HamX = [0 0 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXW = prod(phiW.^West_HamX.*(1-phiW).^(1-West_HamX));
pWest_HamXNW = prod(phiNW.^West_HamX.*(1-phiNW).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXWF = (pWest_HamXW * pW ) / (pWest_HamXW + pWest_HamXNW); %Y=1
pWest_HamXNWF = (pWest_HamXNW * pW ) / (pWest_HamXW + pWest_HamXNW); %Y=0

West_HamD = West_HamY; %new array to begin second binary classification
West_HamD(West_HamD==2)=0; %change all wins to a 0

pD = sum (West_HamD) / size (West_HamD,1); %probability of a draw
pND = sum (1-West_HamD) / size (West_HamD,1); %probability of not drawing

%P(x_i|Y):
phiD = West_Ham_G * West_HamD / sum(West_HamD); %all instances where (i) = 1 and there is a win
phiND = West_Ham_G * (1-West_HamD) / sum(1-West_HamD); %all instances where (i) = 0 and its another result

%test point
West_HamX = [0 0 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXD = prod(phiD.^West_HamX.*(1-phiD).^(1-West_HamX));
pWest_HamXND = prod(phiND.^West_HamX.*(1-phiND).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXDF = (pWest_HamXD * pD ) / (pWest_HamXD + pWest_HamXND); %Y=1
pWest_HamXNDF = (pWest_HamXND * pD ) / (pWest_HamXD + pWest_HamXND); %Y=0

West_HamL = West_HamY; %new array to begin second binary classification
West_HamL(West_HamL==1)=3; %change all draws to a 3
West_HamL(West_HamL==0)=1; %change all losses to a 1
West_HamL(West_HamL==2)=0; %change all wins to a 0
West_HamL(West_HamL==3)=0; %change all draws to a 0

pL = sum (West_HamL) / size (West_HamL,1); %probability of a draw
pNL = sum (1-West_HamL) / size (West_HamL,1); %probability of not drawing

%P(x_i|Y):
phiL = West_Ham_G * West_HamL / sum(West_HamL); %all instances where (i) = 1 and there is a win
phiNL = West_Ham_G * (1-West_HamL) / sum(1-West_HamL); %all instances where (i) = 0 and its another result

%test point
West_HamX = [0 0 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXL = prod(phiL.^West_HamX.*(1-phiL).^(1-West_HamX));
pWest_HamXNL = prod(phiNL.^West_HamX.*(1-phiNL).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXLF = (pWest_HamXL * pL ) / (pWest_HamXL + pWest_HamXNL); %Y=1
pWest_HamXNLF = (pWest_HamXNL * pL ) / (pWest_HamXL + pWest_HamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pWest_HamXWF;
Draw = pWest_HamXDF;
Lose = pWest_HamXLF;
West_Ham_Probs = [Win, Draw, Lose];
West_Ham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(West_Ham_Probs);


West_Ham_str = ['Arsenal vs West Ham: Arsenal will ',West_Ham_Probs_name{ind}];
disp(West_Ham_str)
%---------------------------------------------------------------------------------------%
%Our training data
Newcastle_NBC = [0 0 1 1 2 0 2;1 0 1 1 2 0 2;1 1 1 1 2 0 2;0 0 0 0 1 0 1;0 0 1 1 2 0 1;1 1 1 1 2 0 0;0 1 1 1 2 0 2;1 1 0 0 0 0 2;1 1 1 1 2 0 2;0 0 1 1 2 0 1;0 0 1 1 0 0 1;1 0 1 1 2 0 1;0 1 1 1 0 0 0;1 1 0 0 0 0 2;1 0 1 1 0 0 2;0 0 1 1 2 0 2;0 0 1 1 2 0 1;1 0 1 1 1 1 2;0 0 1 1 2 0 1;1 1 1 1 2 0 2;0 1 1 1 2 0 2;1 0 1 1 1 0 0;0 1 1 1 2 0 1;1 1 1 1 2 0 2;0 0 1 1 1 0 0;1 1 0 1 2 0 1;0 1 0 1 2 0 1;1 1 0 1 0 0 2;1 1 1 1 2 0 2;0 0 1 0 0 0 2;1 0 0 1 0 1 0;0 1 1 1 2 0 2;];
Newcastle_G = Newcastle_NBC;
Newcastle_G(:,3)=[];Newcastle_G(:,4)=[];
NewcastleY = Newcastle_G(:,5); %get our class variable
Newcastle_G = Newcastle_G(:,1:4)'; %features are now displayed correct way

NewcastleW = NewcastleY; %new array to begin first binary classification
NewcastleW(NewcastleW==1)=0; %change all draws to a 0
NewcastleW(NewcastleW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (NewcastleW) / size (NewcastleW,1); %get probability of a win
pNW = sum (1-NewcastleW) / size (NewcastleW,1); %get probability of other results

%P(x_i|Y):
phiW = Newcastle_G * NewcastleW / sum(NewcastleW); %all instances where (i) = 1 and there is a win
phiNW = Newcastle_G * (1-NewcastleW) / sum(1-NewcastleW); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNewcastleXW = prod(phiW.^NewcastleX.*(1-phiW).^(1-NewcastleX));
pNewcastleXNW = prod(phiNW.^NewcastleX.*(1-phiNW).^(1-NewcastleX));

%P(Y=1|X) & P(Y=0|X):
pNewcastleXWF = (pNewcastleXW * pW ) / (pNewcastleXW + pNewcastleXNW); %Y=1
pNewcastleXNWF = (pNewcastleXNW * pW ) / (pNewcastleXW + pNewcastleXNW); %Y=0

NewcastleD = NewcastleY; %new array to begin second binary classification
NewcastleD(NewcastleD==2)=0; %change all wins to a 0

pD = sum (NewcastleD) / size (NewcastleD,1); %probability of a draw
pND = sum (1-NewcastleD) / size (NewcastleD,1); %probability of not drawing

%P(x_i|Y):
phiD = Newcastle_G * NewcastleD / sum(NewcastleD); %all instances where (i) = 1 and there is a win
phiND = Newcastle_G * (1-NewcastleD) / sum(1-NewcastleD); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNewcastleXD = prod(phiD.^NewcastleX.*(1-phiD).^(1-NewcastleX));
pNewcastleXND = prod(phiND.^NewcastleX.*(1-phiND).^(1-NewcastleX));

%P(Y=1|X) & P(Y=0|X):
pNewcastleXDF = (pNewcastleXD * pD ) / (pNewcastleXD + pNewcastleXND); %Y=1
pNewcastleXNDF = (pNewcastleXND * pD ) / (pNewcastleXD + pNewcastleXND); %Y=0

NewcastleL = NewcastleY; %new array to begin second binary classification
NewcastleL(NewcastleL==1)=3; %change all draws to a 3
NewcastleL(NewcastleL==0)=1; %change all losses to a 1
NewcastleL(NewcastleL==2)=0; %change all wins to a 0
NewcastleL(NewcastleL==3)=0; %change all draws to a 0

pL = sum (NewcastleL) / size (NewcastleL,1); %probability of a draw
pNL = sum (1-NewcastleL) / size (NewcastleL,1); %probability of not drawing

%P(x_i|Y):
phiL = Newcastle_G * NewcastleL / sum(NewcastleL); %all instances where (i) = 1 and there is a win
phiNL = Newcastle_G * (1-NewcastleL) / sum(1-NewcastleL); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNewcastleXL = prod(phiL.^NewcastleX.*(1-phiL).^(1-NewcastleX));
pNewcastleXNL = prod(phiNL.^NewcastleX.*(1-phiNL).^(1-NewcastleX));

%P(Y=1|X) & P(Y=0|X):
pNewcastleXLF = (pNewcastleXL * pL ) / (pNewcastleXL + pNewcastleXNL); %Y=1
pNewcastleXNLF = (pNewcastleXNL * pL ) / (pNewcastleXL + pNewcastleXNL); %Y=0

%voting system chooses the probability with highest value
Win = pNewcastleXWF;
Draw = pNewcastleXDF;
Lose = pNewcastleXLF;
Newcastle_Probs = [Win, Draw, Lose];
Newcastle_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Newcastle_Probs);


Newcastle_str = ['Arsenal vs Newcastle: Arsenal will ',Newcastle_Probs_name{ind}];
disp(Newcastle_str)
%------------------------------------------------------------------------------------%
%Our training data
Aston_Villa_NBC = [1 0 0 0 2 0 0;1 1 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 2 0 2;0 0 1 1 0 1 2;1 0 1 0 0 0 0;0 1 0 1 0 0 2;0 1 0 1 2 0 1;1 0 0 0 2 0 2;0 0 1 0 1 0 1;1 1 1 1 2 1 0;1 0 1 1 1 0 1;0 1 1 0 2 0 2;0 1 1 1 2 0 2;1 1 0 0 2 0 1;1 1 1 1 2 0 2;0 0 1 1 2 0 1;0 0 1 1 0 0 2;1 0 1 1 2 0 2;0 0 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 2 0 1;1 1 1 0 0 0 2;0 1 1 1 2 0 2;1 1 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 0 2 1 2;0 1 0 0 2 0 1;1 0 0 0 0 0 2;1 0 0 1 0 0 2;0 1 0 0 1 0 0;0 0 1 1 0 0 0;1 0 0 1 1 0 1;1 0 0 0 1 0 1;];
Aston_Villa_G = Aston_Villa_NBC;
Aston_Villa_G(:,3)=[];Aston_Villa_G(:,4)=[];
Aston_VillaY = Aston_Villa_G(:,5); %get our class variable
Aston_Villa_G = Aston_Villa_G(:,1:4)'; %features are now displayed correct way

Aston_VillaW = Aston_VillaY; %new array to begin first binary classification
Aston_VillaW(Aston_VillaW==1)=0; %change all draws to a 0
Aston_VillaW(Aston_VillaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Aston_VillaW) / size (Aston_VillaW,1); %get probability of a win
pNW = sum (1-Aston_VillaW) / size (Aston_VillaW,1); %get probability of other results

%P(x_i|Y):
phiW = Aston_Villa_G * Aston_VillaW / sum(Aston_VillaW); %all instances where (i) = 1 and there is a win
phiNW = Aston_Villa_G * (1-Aston_VillaW) / sum(1-Aston_VillaW); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [0 1 2 0]'; %the next game to predict

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
phiD = Aston_Villa_G * Aston_VillaD / sum(Aston_VillaD); %all instances where (i) = 1 and there is a win
phiND = Aston_Villa_G * (1-Aston_VillaD) / sum(1-Aston_VillaD); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [0 1 2 0]'; %the next game to predict

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
phiL = Aston_Villa_G * Aston_VillaL / sum(Aston_VillaL); %all instances where (i) = 1 and there is a win
phiNL = Aston_Villa_G * (1-Aston_VillaL) / sum(1-Aston_VillaL); %all instances where (i) = 0 and its another result

%test point
Aston_VillaX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pAston_VillaXL = prod(phiL.^Aston_VillaX.*(1-phiL).^(1-Aston_VillaX));
pAston_VillaXNL = prod(phiNL.^Aston_VillaX.*(1-phiNL).^(1-Aston_VillaX));

%P(Y=1|X) & P(Y=0|X):
pAston_VillaXLF = (pAston_VillaXL * pL ) / (pAston_VillaXL + pAston_VillaXNL); %Y=1
pAston_VillaXNLF = (pAston_VillaXNL * pL ) / (pAston_VillaXL + pAston_VillaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pAston_VillaXWF;
Draw = pAston_VillaXDF;
Lose = pAston_VillaXLF;
Aston_Villa_Probs = [Win, Draw, Lose];
Aston_Villa_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Aston_Villa_Probs);

Aston_Villa_str2 = ['Arsenal vs Aston Villa: Arsenal will ',Aston_Villa_Probs_name{ind}];
disp(Aston_Villa_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Fulham_NBC = [0 1 0 0 0 0 2;0 0 1 1 1 0 2;1 1 0 1 0 1 1;0 0 1 0 2 0 0;1 1 1 0 2 0 1;0 0 1 0 0 0 1;1 1 1 1 2 0 2;1 0 1 1 0 0 2;0 1 1 0 2 0 2;1 1 1 0 1 0 1;0 0 0 1 2 0 0;0 0 1 1 1 0 2;1 0 0 0 1 0 2;1 0 1 1 1 0 2;0 0 1 1 0 0 0;0 0 1 1 0 0 2;1 0 1 1 0 1 2;1 0 1 1 2 0 2;0 0 1 1 2 0 2;0 0 1 1 1 0 2;1 1 1 1 2 0 1;1 0 1 1 1 0 2;0 1 1 1 0 0 2;1 1 1 0 2 0 2;0 1 1 1 1 0 2;];
Fulham_G = Fulham_NBC;
Fulham_G(:,3)=[];Fulham_G(:,4)=[];
FulhamY = Fulham_G(:,5); %get our class variable
Fulham_G = Fulham_G(:,1:4)'; %features are now displayed correct way

FulhamW = FulhamY; %new array to begin first binary classification
FulhamW(FulhamW==1)=0; %change all draws to a 0
FulhamW(FulhamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (FulhamW) / size (FulhamW,1); %get probability of a win
pNW = sum (1-FulhamW) / size (FulhamW,1); %get probability of other results

%P(x_i|Y):
phiW = Fulham_G * FulhamW / sum(FulhamW); %all instances where (i) = 1 and there is a win
phiNW = Fulham_G * (1-FulhamW) / sum(1-FulhamW); %all instances where (i) = 0 and its another result

%test point
FulhamX = [1 0 2 0]'; %the next game to predict

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
phiD = Fulham_G * FulhamD / sum(FulhamD); %all instances where (i) = 1 and there is a win
phiND = Fulham_G * (1-FulhamD) / sum(1-FulhamD); %all instances where (i) = 0 and its another result

%test point
FulhamX = [1 0 2 0]'; %the next game to predict

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
phiL = Fulham_G * FulhamL / sum(FulhamL); %all instances where (i) = 1 and there is a win
phiNL = Fulham_G * (1-FulhamL) / sum(1-FulhamL); %all instances where (i) = 0 and its another result

%test point
FulhamX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pFulhamXL = prod(phiL.^FulhamX.*(1-phiL).^(1-FulhamX));
pFulhamXNL = prod(phiNL.^FulhamX.*(1-phiNL).^(1-FulhamX));

%P(Y=1|X) & P(Y=0|X):
pFulhamXLF = (pFulhamXL * pL ) / (pFulhamXL + pFulhamXNL); %Y=1
pxFulhamXNLF = (pFulhamXNL * pL ) / (pFulhamXL + pFulhamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pFulhamXWF;
Draw = pFulhamXDF;
Lose = pFulhamXLF;
Fulham_Probs = [Win, Draw, Lose];
Fulham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Fulham_Probs);


Fulham_str2 = ['Arsenal vs Fulham: Arsenal will ',Fulham_Probs_name{ind}];
disp(Fulham_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Southampton_NBC = [1 0 1 0 0 1 2;0 0 1 1 2 0 1;1 0 0 1 2 0 2;0 1 1 1 2 0 1;1 1 1 1 0 0 1;1 0 1 1 2 0 2;0 0 1 1 2 0 2;1 0 1 0 0 0 2;0 0 1 1 2 0 0;1 0 1 1 2 0 1;0 0 1 1 2 0 2;0 0 1 1 1 0 0;1 0 1 1 0 0 2;1 0 1 1 0 0 2;0 1 0 1 2 0 2;0 0 1 1 2 0 1;1 0 1 1 2 0 1;1 1 1 1 1 0 2;0 0 1 1 2 0 2;0 0 1 1 2 0 2;1 0 1 1 2 1 2;];
Southampton_G = Southampton_NBC;
Southampton_G(:,3)=[];Southampton_G(:,4)=[];
SouthamptonY = Southampton_G(:,5); %get our class variable
Southampton_G = Southampton_G(:,1:4)'; %features are now displayed correct way

SouthamptonW = SouthamptonY; %new array to begin first binary classification
SouthamptonW(SouthamptonW==1)=0; %change all draws to a 0
SouthamptonW(SouthamptonW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SouthamptonW) / size (SouthamptonW,1); %get probability of a win
pNW = sum (1-SouthamptonW) / size (SouthamptonW,1); %get probability of other results

%P(x_i|Y):
phiW = Southampton_G * SouthamptonW / sum(SouthamptonW); %all instances where (i) = 1 and there is a win
phiNW = Southampton_G * (1-SouthamptonW) / sum(1-SouthamptonW); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXW = prod(phiW.^SouthamptonX.*(1-phiW).^(1-SouthamptonX));
pSouthamptonXNW = prod(phiNW.^SouthamptonX.*(1-phiNW).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXWF = (pSouthamptonXW * pW ) / (pSouthamptonXW + pSouthamptonXNW); %Y=1
pSouthamptonXNWF = (pSouthamptonXNW * pW ) / (pSouthamptonXW + pSouthamptonXNW); %Y=0

SouthamptonD = SouthamptonY; %new array to begin second binary classification
SouthamptonD(SouthamptonD==2)=0; %change all wins to a 0

pD = sum (SouthamptonD) / size (SouthamptonD,1); %probability of a draw
pND = sum (1-SouthamptonD) / size (SouthamptonD,1); %probability of not drawing

%P(x_i|Y):
phiD = Southampton_G * SouthamptonD / sum(SouthamptonD); %all instances where (i) = 1 and there is a win
phiND = Southampton_G * (1-SouthamptonD) / sum(1-SouthamptonD); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXD = prod(phiD.^SouthamptonX.*(1-phiD).^(1-SouthamptonX));
pSouthamptonXND = prod(phiND.^SouthamptonX.*(1-phiND).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXDF = (pSouthamptonXD * pD ) / (pSouthamptonXD + pSouthamptonXND); %Y=1
pSouthamptonXNDF = (pSouthamptonXND * pD ) / (pSouthamptonXD + pSouthamptonXND); %Y=0

SouthamptonL = SouthamptonY; %new array to begin second binary classification
SouthamptonL(SouthamptonL==1)=3; %change all draws to a 3
SouthamptonL(SouthamptonL==0)=1; %change all losses to a 1
SouthamptonL(SouthamptonL==2)=0; %change all wins to a 0
SouthamptonL(SouthamptonL==3)=0; %change all draws to a 0

pL = sum (SouthamptonL) / size (SouthamptonL,1); %probability of a draw
pNL = sum (1-SouthamptonL) / size (SouthamptonL,1); %probability of not drawing

%P(x_i|Y):
phiL = Southampton_G * SouthamptonL / sum(SouthamptonL); %all instances where (i) = 1 and there is a win
phiNL = Southampton_G * (1-SouthamptonL) / sum(1-SouthamptonL); %all instances where (i) = 0 and its another result

%test point
SouthamptonX = [0 1 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSouthamptonXL = prod(phiL.^SouthamptonX.*(1-phiL).^(1-SouthamptonX));
pSouthamptonXNL = prod(phiNL.^SouthamptonX.*(1-phiNL).^(1-SouthamptonX));

%P(Y=1|X) & P(Y=0|X):
pSouthamptonXLF = (pSouthamptonXL * pL ) / (pSouthamptonXL + pSouthamptonXNL); %Y=1
pSouthamptonXNLF = (pSouthamptonXNL * pL ) / (pSouthamptonXL + pSouthamptonXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSouthamptonXWF;
Draw = pSouthamptonXDF;
Lose = pSouthamptonXLF;
Southampton_Probs = [Win, Draw, Lose];
Southampton_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Southampton_Probs);


Southampton_str2 = ['Arsenal vs Southampton: Arsenal will ',Southampton_Probs_name{ind}];
disp(Southampton_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Liverpool_NBC = [1 1 1 0 2 0 2;1 1 1 1 2 0 1;0 0 0 1 1 0 2;0 0 1 0 2 0 2;1 1 0 1 1 0 0;1 0 1 1 2 0 1;0 0 0 0 2 0 1;1 0 1 0 0 1 2;0 1 1 1 2 0 2;0 1 0 0 2 0 1;1 0 1 0 1 0 1;1 1 1 0 2 0 1;0 1 1 0 2 0 1;0 0 1 0 0 0 0;1 1 1 1 0 0 2;1 1 1 0 2 0 2;0 0 1 0 1 0 0;1 0 1 1 2 0 2;0 1 1 0 1 0 0;1 1 1 1 1 0 2;0 1 1 1 2 0 2;0 1 1 0 2 0 1;1 0 1 0 2 0 1;1 1 1 0 0 0 1;0 0 1 0 1 0 2;0 0 0 1 0 0 0;1 0 0 0 0 0 0;1 0 1 0 2 0 0;0 0 1 0 2 0 0;1 1 0 1 2 0 1;0 0 0 0 2 0 1;0 0 1 1 2 0 0;1 0 1 0 0 0 0;1 0 0 0 2 0 0;];
Liverpool_G = Liverpool_NBC;
Liverpool_G(:,3)=[];Liverpool_G(:,4)=[];
LiverpoolY = Liverpool_G(:,5); %get our class variable
Liverpool_G = Liverpool_G(:,1:4)'; %features are now displayed correct way

LiverpoolW = LiverpoolY; %new array to begin first binary classification
LiverpoolW(LiverpoolW==1)=0; %change all draws to a 0
LiverpoolW(LiverpoolW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (LiverpoolW) / size (LiverpoolW,1); %get probability of a win
pNW = sum (1-LiverpoolW) / size (LiverpoolW,1); %get probability of other results

%P(x_i|Y):
phiW = Liverpool_G * LiverpoolW / sum(LiverpoolW); %all instances where (i) = 1 and there is a win
phiNW = Liverpool_G * (1-LiverpoolW) / sum(1-LiverpoolW); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [0 0 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXW = prod(phiW.^LiverpoolX.*(1-phiW).^(1-LiverpoolX));
pLiverpoolXNW = prod(phiNW.^LiverpoolX.*(1-phiNW).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pLiverpoolXWF = (pLiverpoolXW * pW ) / (pLiverpoolXW + pLiverpoolXNW); %Y=1
pLiverpoolXNWF = (pLiverpoolXNW * pW ) / (pLiverpoolXW + pLiverpoolXNW); %Y=0

LiverpoolD = LiverpoolY; %new array to begin second binary classification
LiverpoolD(LiverpoolD==2)=0; %change all wins to a 0

pD = sum (LiverpoolD) / size (LiverpoolD,1); %probability of a draw
pND = sum (1-LiverpoolD) / size (LiverpoolD,1); %probability of not drawing

%P(x_i|Y):
phiD = Liverpool_G * LiverpoolD / sum(LiverpoolD); %all instances where (i) = 1 and there is a win
phiND = Liverpool_G * (1-LiverpoolD) / sum(1-LiverpoolD); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [0 0 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXD = prod(phiD.^LiverpoolX.*(1-phiD).^(1-LiverpoolX));
pLiverpoolXND = prod(phiND.^LiverpoolX.*(1-phiND).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pLiverpoolXDF = (pLiverpoolXD * pD ) / (pLiverpoolXD + pLiverpoolXND); %Y=1
pLiverpoolXNDF = (pLiverpoolXND * pD ) / (pLiverpoolXD + pLiverpoolXND); %Y=0

LiverpoolL = LiverpoolY; %new array to begin second binary classification
LiverpoolL(LiverpoolL==1)=3; %change all draws to a 3
LiverpoolL(LiverpoolL==0)=1; %change all losses to a 1
LiverpoolL(LiverpoolL==2)=0; %change all wins to a 0
LiverpoolL(LiverpoolL==3)=0; %change all draws to a 0

pL = sum (LiverpoolL) / size (LiverpoolL,1); %probability of a draw
pNL = sum (1-LiverpoolL) / size (LiverpoolL,1); %probability of not drawing

%P(x_i|Y):
phiL = Liverpool_G * LiverpoolL / sum(LiverpoolL); %all instances where (i) = 1 and there is a win
phiNL = Liverpool_G * (1-LiverpoolL) / sum(1-LiverpoolL); %all instances where (i) = 0 and its another result

%test point
LiverpoolX = [0 0 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pLiverpoolXL = prod(phiL.^LiverpoolX.*(1-phiL).^(1-LiverpoolX));
pLiverpoolXNL = prod(phiNL.^LiverpoolX.*(1-phiNL).^(1-LiverpoolX));

%P(Y=1|X) & P(Y=0|X):
pLiverpoolXLF = (pLiverpoolXL * pL ) / (pLiverpoolXL + pLiverpoolXNL); %Y=1
pLiverpoolXNLF = (pLiverpoolXNL * pL ) / (pLiverpoolXL + pLiverpoolXNL); %Y=0

%voting system chooses the probability with highest value
Win = pLiverpoolXWF;
Draw = pLiverpoolXDF;
Lose = pLiverpoolXLF;
Liverpool_Probs = [Win, Draw, Lose];
Liverpool_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Liverpool_Probs);


Liverpool_str2 = ['Arsenal vs Liverpool: Arsenal will ',Liverpool_Probs_name{ind}];
disp(Liverpool_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Man_United_NBC = [0 1 1 1 2 0 0;1 0 0 0 2 0 1;0 1 1 0 2 0 0;1 0 0 0 0 0 0;0 1 0 0 0 0 0;1 0 0 0 0 0 0;0 1 0 0 2 0 0;1 0 1 0 1 0 0;0 1 1 0 2 0 0;0 0 0 0 0 1 1;1 1 1 0 0 0 2;0 1 0 0 1 0 0;1 1 1 0 1 0 1;1 1 0 0 2 0 2;0 1 0 0 1 0 2;0 1 0 1 2 0 0;1 0 0 1 1 0 1;1 1 1 0 2 0 0;0 1 1 0 2 0 0;1 1 1 1 2 0 1;0 1 1 0 1 0 1;1 1 1 0 1 0 1;0 0 1 0 2 0 0;0 1 0 1 2 0 2;1 1 0 1 1 0 2;0 1 0 0 2 0 0;1 1 0 0 1 0 2;0 1 0 1 2 0 1;1 0 0 0 1 0 0;0 1 0 1 2 0 1;1 1 0 1 1 0 2;0 0 0 0 2 0 2;1 0 0 0 0 0 2;1 0 0 1 1 0 0;0 1 1 1 1 0 0;];
Man_United_G = Man_United_NBC;
Man_United_G(:,3)=[];Man_United_G(:,4)=[];
Man_UnitedY = Man_United_G(:,5); %get our class variable
Man_United_G = Man_United_G(:,1:4)'; %features are now displayed correct way

Man_UnitedW = Man_UnitedY; %new array to begin first binary classification
Man_UnitedW(Man_UnitedW==1)=0; %change all draws to a 0
Man_UnitedW(Man_UnitedW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Man_UnitedW) / size (Man_UnitedW,1); %get probability of a win
pNW = sum (1-Man_UnitedW) / size (Man_UnitedW,1); %get probability of other results

%P(x_i|Y):
phiW = Man_United_G * Man_UnitedW / sum(Man_UnitedW); %all instances where (i) = 1 and there is a win
phiNW = Man_United_G * (1-Man_UnitedW) / sum(1-Man_UnitedW); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [1 0 0 0]'; %the next game to predict

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
phiD = Man_United_G * Man_UnitedD / sum(Man_UnitedD); %all instances where (i) = 1 and there is a win
phiND = Man_United_G * (1-Man_UnitedD) / sum(1-Man_UnitedD); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [1 0 0 0]'; %the next game to predict

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
phiL = Man_United_G * Man_UnitedL / sum(Man_UnitedL); %all instances where (i) = 1 and there is a win
phiNL = Man_United_G * (1-Man_UnitedL) / sum(1-Man_UnitedL); %all instances where (i) = 0 and its another result

%test point
Man_UnitedX = [1 0 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_UnitedXL = prod(phiL.^Man_UnitedX.*(1-phiL).^(1-Man_UnitedX));
pMan_UnitedXNL = prod(phiNL.^Man_UnitedX.*(1-phiNL).^(1-Man_UnitedX));

%P(Y=1|X) & P(Y=0|X):
pMan_UnitedXLF = (pMan_UnitedXL * pL ) / (pMan_UnitedXL + pMan_UnitedXNL); %Y=1
pMan_UnitedXNLF = (pMan_UnitedXNL * pL ) / (pMan_UnitedXL + pMan_UnitedXNL); %Y=0

%voting system chooses the probability with highest value
Win = pMan_UnitedXWF;
Draw = pMan_UnitedXDF;
Lose = pMan_UnitedXLF;
Man_United_Probs = [Win, Draw, Lose];
Man_United_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Man_United_Probs);

Man_United_str2 = ['Arsenal vs Man United: Arsenal will ',Man_United_Probs_name{ind}];
disp(Man_United_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Sunderland_NBC = [0 0 1 1 2 0 2;0 0 1 1 2 0 2;1 0 0 0 2 0 1;0 0 1 0 2 0 2;1 0 1 0 0 0 2;1 1 1 1 2 0 1;0 1 1 1 2 0 1;1 1 1 1 2 0 2;0 0 1 1 2 0 0;1 0 1 1 1 0 1;0 1 1 1 0 0 1;0 0 1 1 2 0 2;1 1 1 1 2 0 2;0 1 1 1 1 0 2;1 1 1 1 1 0 2;0 0 1 1 2 0 2;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 1 0 1;1 0 1 0 2 0 1;0 0 0 0 0 0 0;1 1 1 1 1 0 2;0 0 1 1 2 0 1;0 1 1 1 2 0 0;];
Sunderland_G = Sunderland_NBC;
Sunderland_G(:,3)=[];Sunderland_G(:,4)=[];
SunderlandY = Sunderland_G(:,5); %get our class variable
Sunderland_G = Sunderland_G(:,1:4)'; %features are now displayed correct way

SunderlandW = SunderlandY; %new array to begin first binary classification
SunderlandW(SunderlandW==1)=0; %change all draws to a 0
SunderlandW(SunderlandW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SunderlandW) / size (SunderlandW,1); %get probability of a win
pNW = sum (1-SunderlandW) / size (SunderlandW,1); %get probability of other results

%P(x_i|Y):
phiW = Sunderland_G * SunderlandW / sum(SunderlandW); %all instances where (i) = 1 and there is a win
phiNW = Sunderland_G * (1-SunderlandW) / sum(1-SunderlandW); %all instances where (i) = 0 and its another result

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
phiD = Sunderland_G * SunderlandD / sum(SunderlandD); %all instances where (i) = 1 and there is a win
phiND = Sunderland_G * (1-SunderlandD) / sum(1-SunderlandD); %all instances where (i) = 0 and its another result

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
phiL = Sunderland_G * SunderlandL / sum(SunderlandL); %all instances where (i) = 1 and there is a win
phiNL = Sunderland_G * (1-SunderlandL) / sum(1-SunderlandL); %all instances where (i) = 0 and its another result

%test point
SunderlandX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSunderlandXL = prod(phiL.^SunderlandX.*(1-phiL).^(1-SunderlandX));
pSunderlandXNL = prod(phiNL.^SunderlandX.*(1-phiNL).^(1-SunderlandX));

%P(Y=1|X) & P(Y=0|X):
pSunderlandXLF = (pSunderlandXL * pL ) / (pSunderlandXL + pSunderlandXNL); %Y=1
pSunderlandXNLF = (pSunderlandXNL * pL ) / (pSunderlandXL + pSunderlandXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSunderlandXWF;
Draw = pSunderlandXDF;
Lose = pSunderlandXLF;
Sunderland_Probs = [Win, Draw, Lose];
Sunderland_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Sunderland_Probs);


Sunderland_str2 = ['Arsenal vs Sunderland: Arsenal will ',Sunderland_Probs_name{ind}];
disp(Sunderland_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Stoke_NBC = [1 1 1 0 2 0 2;1 0 1 0 1 0 2;0 0 0 1 1 0 1;0 0 1 1 1 1 1;1 1 1 0 2 0 2;0 0 1 1 2 1 0;1 1 1 1 2 0 2;0 0 1 0 2 0 2;1 1 1 0 0 1 2;1 0 1 1 1 1 2;0 0 1 1 1 0 0;];
Stoke_G = Stoke_NBC;
Stoke_G(:,3)=[];Stoke_G(:,4)=[];
StokeY = Stoke_G(:,5); %get our class variable
Stoke_G = Stoke_G(:,1:4)'; %features are now displayed correct way

StokeW = StokeY; %new array to begin first binary classification
StokeW(StokeW==1)=0; %change all draws to a 0
StokeW(StokeW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (StokeW) / size (StokeW,1); %get probability of a win
pNW = sum (1-StokeW) / size (StokeW,1); %get probability of other results

%P(x_i|Y):
phiW = Stoke_G * StokeW / sum(StokeW); %all instances where (i) = 1 and there is a win
phiNW = Stoke_G * (1-StokeW) / sum(1-StokeW); %all instances where (i) = 0 and its another result

%test point
StokeX = [0 0 2 0]'; %the next game to predict

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
phiD = Stoke_G * StokeD / sum(StokeD); %all instances where (i) = 1 and there is a win
phiND = Stoke_G * (1-StokeD) / sum(1-StokeD); %all instances where (i) = 0 and its another result

%test point
StokeX = [0 0 2 0]'; %the next game to predict

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
phiL = Stoke_G * StokeL / sum(StokeL); %all instances where (i) = 1 and there is a win
phiNL = Stoke_G * (1-StokeL) / sum(1-StokeL); %all instances where (i) = 0 and its another result

%test point
StokeX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pStokeXL = prod(phiL.^StokeX.*(1-phiL).^(1-StokeX));
pStokeXNL = prod(phiNL.^StokeX.*(1-phiNL).^(1-StokeX));

%P(Y=1|X) & P(Y=0|X):
pStokeXLF = (pStokeXL * pL ) / (pStokeXL + pStokeXNL); %Y=1
pStokeXNLF = (pStokeXNL * pL ) / (pStokeXL + pStokeXNL); %Y=0

%voting system chooses the probability with highest value
Win = pStokeXWF;
Draw = pStokeXDF;
Lose = pStokeXLF;
Stoke_Probs = [Win, Draw, Lose];
Stoke_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Stoke_Probs);


Stoke_str2 = ['Arsenal vs Stoke: Arsenal will ',Stoke_Probs_name{ind}];
disp(Stoke_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Tottenham_NBC = [1 1 1 0 2 0 2;0 1 1 1 2 0 0;1 0 0 1 1 0 2;1 1 0 0 2 0 2;0 1 0 0 2 0 0;0 0 1 1 1 0 1;1 1 1 1 2 0 0;0 1 1 0 2 0 0;1 1 1 1 1 0 2;0 0 1 1 1 0 1;1 0 1 1 2 0 1;1 1 1 1 2 1 2;0 0 0 1 2 0 2;0 0 1 1 2 0 1;1 0 1 1 0 0 2;1 1 1 1 2 0 1;0 1 0 0 2 0 1;1 0 1 1 1 0 2;0 1 1 0 1 0 2;0 0 1 1 2 0 1;1 1 1 1 2 0 2;0 1 1 1 0 0 1;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 0 0 1;1 0 1 1 1 0 2;0 0 1 1 2 0 1;1 1 1 1 0 0 2;0 1 0 1 1 0 0;0 0 1 1 2 0 2;1 1 0 1 2 0 1;0 0 1 1 2 0 1;1 0 1 1 1 0 1;0 0 1 1 1 0 1;1 0 1 0 0 0 2;];
Tottenham_G = Tottenham_NBC;
Tottenham_G(:,3)=[];Tottenham_G(:,4)=[];
TottenhamY = Tottenham_G(:,5); %get our class variable
Tottenham_G = Tottenham_G(:,1:4)'; %features are now displayed correct way

TottenhamW = TottenhamY; %new array to begin first binary classification
TottenhamW(TottenhamW==1)=0; %change all draws to a 0
TottenhamW(TottenhamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (TottenhamW) / size (TottenhamW,1); %get probability of a win
pNW = sum (1-TottenhamW) / size (TottenhamW,1); %get probability of other results

%P(x_i|Y):
phiW = Tottenham_G * TottenhamW / sum(TottenhamW); %all instances where (i) = 1 and there is a win
phiNW = Tottenham_G * (1-TottenhamW) / sum(1-TottenhamW); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [0 1 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXW = prod(phiW.^TottenhamX.*(1-phiW).^(1-TottenhamX));
pTottenhamXNW = prod(phiNW.^TottenhamX.*(1-phiNW).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXWF = (pTottenhamXW * pW ) / (pTottenhamXW + pTottenhamXNW); %Y=1
pTottenhamXNWF = (pTottenhamXNW * pW ) / (pTottenhamXW + pTottenhamXNW); %Y=0

TottenhamD = TottenhamY; %new array to begin second binary classification
TottenhamD(TottenhamD==2)=0; %change all wins to a 0

pD = sum (TottenhamD) / size (TottenhamD,1); %probability of a draw
pND = sum (1-TottenhamD) / size (TottenhamD,1); %probability of not drawing

%P(x_i|Y):
phiD = Tottenham_G * TottenhamD / sum(TottenhamD); %all instances where (i) = 1 and there is a win
phiND = Tottenham_G * (1-TottenhamD) / sum(1-TottenhamD); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [0 1 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXD = prod(phiD.^TottenhamX.*(1-phiD).^(1-TottenhamX));
pTottenhamXND = prod(phiND.^TottenhamX.*(1-phiND).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXDF = (pTottenhamXD * pD ) / (pTottenhamXD + pTottenhamXND); %Y=1
pTottenhamXNDF = (pTottenhamXND * pD ) / (pTottenhamXD + pTottenhamXND); %Y=0

TottenhamL = TottenhamY; %new array to begin second binary classification
TottenhamL(TottenhamL==1)=3; %change all draws to a 3
TottenhamL(TottenhamL==0)=1; %change all losses to a 1
TottenhamL(TottenhamL==2)=0; %change all wins to a 0
TottenhamL(TottenhamL==3)=0; %change all draws to a 0

pL = sum (TottenhamL) / size (TottenhamL,1); %probability of a draw
pNL = sum (1-TottenhamL) / size (TottenhamL,1); %probability of not drawing

%P(x_i|Y):
phiL = Tottenham_G * TottenhamL / sum(TottenhamL); %all instances where (i) = 1 and there is a win
phiNL = Tottenham_G * (1-TottenhamL) / sum(1-TottenhamL); %all instances where (i) = 0 and its another result

%test point
TottenhamX = [0 1 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pTottenhamXL = prod(phiL.^TottenhamX.*(1-phiL).^(1-TottenhamX));
pTottenhamXNL = prod(phiNL.^TottenhamX.*(1-phiNL).^(1-TottenhamX));

%P(Y=1|X) & P(Y=0|X):
pTottenhamXLF = (pTottenhamXL * pL ) / (pTottenhamXL + pTottenhamXNL); %Y=1
pTottenhamXNLF = (pTottenhamXNL * pL ) / (pTottenhamXL + pTottenhamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pTottenhamXWF;
Draw = pTottenhamXDF;
Lose = pTottenhamXLF;
Tottenham_Probs = [Win, Draw, Lose];
Tottenham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Tottenham_Probs);


Tottenham_str2 = ['Arsenal vs Tottenham: Arsenal will ',Tottenham_Probs_name{ind}];
disp(Tottenham_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Chelsea_NBC = [1 0 1 1 0 1 1;0 1 0 0 0 1 0;1 1 0 0 1 1 0;1 0 1 0 0 0 1;0 1 0 0 2 0 2;1 0 1 0 0 1 2;0 1 0 0 0 0 0;0 0 1 0 0 1 0;1 1 1 0 0 0 0;1 1 1 0 2 0 0;0 1 0 0 0 0 0;0 0 1 0 1 0 0;1 1 1 0 0 0 2;1 0 0 0 2 0 1;0 1 0 0 2 0 1;1 0 0 0 0 0 0;0 0 1 0 2 0 0;0 1 1 0 2 0 1;1 1 1 0 2 0 1;0 1 1 1 2 0 2;1 0 0 1 2 0 2;1 0 1 0 1 0 2;0 0 1 1 2 0 1;1 0 1 0 2 0 2;0 0 1 0 2 0 1;1 1 0 1 0 0 1;0 0 1 1 2 0 1;1 0 1 1 2 0 2;0 1 1 0 2 0 2;1 1 0 1 2 0 2;0 0 0 1 1 0 1;1 0 0 0 2 0 2;0 1 0 0 2 0 2;0 0 1 1 0 0 2;];
Chelsea_G = Chelsea_NBC;
Chelsea_G(:,3)=[];Chelsea_G(:,4)=[];
ChelseaY = Chelsea_G(:,5); %get our class variable
Chelsea_G = Chelsea_G(:,1:4)'; %features are now displayed correct way

ChelseaW = ChelseaY; %new array to begin first binary classification
ChelseaW(ChelseaW==1)=0; %change all draws to a 0
ChelseaW(ChelseaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (ChelseaW) / size (ChelseaW,1); %get probability of a win
pNW = sum (1-ChelseaW) / size (ChelseaW,1); %get probability of other results

%P(x_i|Y):
phiW = Chelsea_G * ChelseaW / sum(ChelseaW); %all instances where (i) = 1 and there is a win
phiNW = Chelsea_G * (1-ChelseaW) / sum(1-ChelseaW); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [0 0 2 0]'; %the next game to predict

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
phiD = Chelsea_G * ChelseaD / sum(ChelseaD); %all instances where (i) = 1 and there is a win
phiND = Chelsea_G * (1-ChelseaD) / sum(1-ChelseaD); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [0 0 2 0]'; %the next game to predict

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
phiL = Chelsea_G * ChelseaL / sum(ChelseaL); %all instances where (i) = 1 and there is a win
phiNL = Chelsea_G * (1-ChelseaL) / sum(1-ChelseaL); %all instances where (i) = 0 and its another result

%test point
ChelseaX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pChelseaXL = prod(phiL.^ChelseaX.*(1-phiL).^(1-ChelseaX));
pChelseaXNL = prod(phiNL.^ChelseaX.*(1-phiNL).^(1-ChelseaX));

%P(Y=1|X) & P(Y=0|X):
pChelseaXLF = (pChelseaXL * pL ) / (pChelseaXL + pChelseaXNL); %Y=1
pxChelseaXNLF = (pChelseaXNL * pL ) / (pChelseaXL + pChelseaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pChelseaXWF;
Draw = pChelseaXDF;
Lose = pChelseaXLF;
Chelsea_Probs = [Win, Draw, Lose];
Chelsea_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Chelsea_Probs);


Chelsea_str2 = ['Arsenal vs Chelsea: Arsenal will ',Chelsea_Probs_name{ind}];
disp(Chelsea_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Swansea_NBC = [0 1 1 1 2 0 2;0 1 1 1 0 0 2;1 0 1 1 1 0 0;0 1 1 0 0 0 0;1 0 1 0 0 1 2;];
Swansea_G = Swansea_NBC;
Swansea_G(:,3)=[];Swansea_G(:,4)=[];
SwanseaY = Swansea_G(:,5); %get our class variable
Swansea_G = Swansea_G(:,1:4)'; %features are now displayed correct way

SwanseaW = SwanseaY; %new array to begin first binary classification
SwanseaW(SwanseaW==1)=0; %change all draws to a 0
SwanseaW(SwanseaW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (SwanseaW) / size (SwanseaW,1); %get probability of a win
pNW = sum (1-SwanseaW) / size (SwanseaW,1); %get probability of other results

%P(x_i|Y):
phiW = Swansea_G * SwanseaW / sum(SwanseaW); %all instances where (i) = 1 and there is a win
phiNW = Swansea_G * (1-SwanseaW) / sum(1-SwanseaW); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [1 0 0 1]'; %the next game to predict

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
phiD = Swansea_G * SwanseaD / sum(SwanseaD); %all instances where (i) = 1 and there is a win
phiND = Swansea_G * (1-SwanseaD) / sum(1-SwanseaD); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [1 0 0 1]'; %the next game to predict

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
phiL = Swansea_G * SwanseaL / sum(SwanseaL); %all instances where (i) = 1 and there is a win
phiNL = Swansea_G * (1-SwanseaL) / sum(1-SwanseaL); %all instances where (i) = 0 and its another result

%test point
SwanseaX = [1 0 0 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pSwanseaXL = prod(phiL.^SwanseaX.*(1-phiL).^(1-SwanseaX));
pSwanseaXNL = prod(phiNL.^SwanseaX.*(1-phiNL).^(1-SwanseaX));

%P(Y=1|X) & P(Y=0|X):
pSwanseaXLF = (pSwanseaXL * pL ) / (pSwanseaXL + pSwanseaXNL); %Y=1
pSwanseaXNLF = (pSwanseaXNL * pL ) / (pSwanseaXL + pSwanseaXNL); %Y=0

%voting system chooses the probability with highest value
Win = pSwanseaXWF;
Draw = pSwanseaXDF;
Lose = pSwanseaXLF;
Swansea_Probs = [Win, Draw, Lose];
Swansea_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Swansea_Probs);


Swansea_str2 = ['Arsenal vs Swansea: Arsenal will ',Swansea_Probs_name{ind}];
disp(Swansea_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Man_City_NBC = [0 1 0 1 1 0 0;1 1 0 0 1 0 0;0 1 0 1 2 0 1;1 0 0 0 0 0 2;0 0 0 0 2 0 0;1 0 1 0 2 0 1;0 1 1 0 2 0 2;1 0 1 1 0 0 1;0 0 1 0 0 1 0;1 0 1 1 2 0 2;0 0 0 1 0 0 0;0 0 1 1 2 0 2;1 0 0 0 1 0 2;1 0 1 1 2 0 2;0 1 0 1 1 0 0;0 0 1 1 2 0 2;1 1 0 1 0 0 2;1 0 1 0 2 0 1;0 0 1 0 1 0 2;1 1 1 1 2 0 2;0 0 1 1 2 0 2;0 1 1 1 1 0 2;1 0 1 0 1 0 2;0 1 1 1 2 0 2;1 1 1 1 2 0 2;];
Man_City_G = Man_City_NBC;
Man_City_G(:,3)=[];Man_City_G(:,4)=[];
Man_CityY = Man_City_G(:,5); %get our class variable
Man_City_G = Man_City_G(:,1:4)'; %features are now displayed correct way

Man_CityW = Man_CityY; %new array to begin first binary classification
Man_CityW(Man_CityW==1)=0; %change all draws to a 0
Man_CityW(Man_CityW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Man_CityW) / size (Man_CityW,1); %get probability of a win
pNW = sum (1-Man_CityW) / size (Man_CityW,1); %get probability of other results

%P(x_i|Y):
phiW = Man_City_G * Man_CityW / sum(Man_CityW); %all instances where (i) = 1 and there is a win
phiNW = Man_City_G * (1-Man_CityW) / sum(1-Man_CityW); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [1 0 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_CityXW = prod(phiW.^Man_CityX.*(1-phiW).^(1-Man_CityX));
pMan_CityXNW = prod(phiNW.^Man_CityX.*(1-phiNW).^(1-Man_CityX));

%P(Y=1|X) & P(Y=0|X):
pMan_CityXWF = (pMan_CityXW * pW ) / (pMan_CityXW + pMan_CityXNW); %Y=1
pMan_CityXNWF = (pMan_CityXNW * pW ) / (pMan_CityXW + pMan_CityXNW); %Y=0

Man_CityD = Man_CityY; %new array to begin second binary classification
Man_CityD(Man_CityD==2)=0; %change all wins to a 0

pD = sum (Man_CityD) / size (Man_CityD,1); %probability of a draw
pND = sum (1-Man_CityD) / size (Man_CityD,1); %probability of not drawing

%P(x_i|Y):
phiD = Man_City_G * Man_CityD / sum(Man_CityD); %all instances where (i) = 1 and there is a win
phiND = Man_City_G * (1-Man_CityD) / sum(1-Man_CityD); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [1 0 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_CityXD = prod(phiD.^Man_CityX.*(1-phiD).^(1-Man_CityX));
pMan_CityXND = prod(phiND.^Man_CityX.*(1-phiND).^(1-Man_CityX));

%P(Y=1|X) & P(Y=0|X):
pMan_CityXDF = (pMan_CityXD * pD ) / (pMan_CityXD + pMan_CityXND); %Y=1
pMan_CityXNDF = (pMan_CityXND * pD ) / (pMan_CityXD + pMan_CityXND); %Y=0

Man_CityL = Man_CityY; %new array to begin second binary classification
Man_CityL(Man_CityL==1)=3; %change all draws to a 3
Man_CityL(Man_CityL==0)=1; %change all losses to a 1
Man_CityL(Man_CityL==2)=0; %change all wins to a 0
Man_CityL(Man_CityL==3)=0; %change all draws to a 0

pL = sum (Man_CityL) / size (Man_CityL,1); %probability of a draw
pNL = sum (1-Man_CityL) / size (Man_CityL,1); %probability of not drawing

%P(x_i|Y):
phiL = Man_City_G * Man_CityL / sum(Man_CityL); %all instances where (i) = 1 and there is a win
phiNL = Man_City_G * (1-Man_CityL) / sum(1-Man_CityL); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [1 0 1 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_CityXL = prod(phiL.^Man_CityX.*(1-phiL).^(1-Man_CityX));
pMan_CityXNL = prod(phiNL.^Man_CityX.*(1-phiNL).^(1-Man_CityX));

%P(Y=1|X) & P(Y=0|X):
pMan_CityXLF = (pMan_CityXL * pL ) / (pMan_CityXL + pMan_CityXNL); %Y=1
pMan_CityXNLF = (pMan_CityXNL * pL ) / (pMan_CityXL + pMan_CityXNL); %Y=0

%voting system chooses the probability with highest value
Win = pMan_CityXWF;
Draw = pMan_CityXDF;
Lose = pMan_CityXLF;
Man_City_Probs = [Win, Draw, Lose];
Man_City_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Man_City_Probs);


Man_City_str2 = ['Arsenal vs Man City: Arsenal will ',Man_City_Probs_name{ind}];
disp(Man_City_str2)
%--------------------------------------------------------------------------------------%
%Our training data
Everton_NBC = [1 0 1 1 2 0 1;0 0 1 1 2 0 1;1 0 0 1 1 0 1;0 0 1 0 2 0 2;1 1 1 0 2 0 2;1 1 1 1 2 0 2;0 0 1 0 2 0 2;1 1 1 1 2 0 1;0 0 0 0 2 0 2;0 1 1 1 2 0 1;1 0 1 1 1 0 2;1 0 1 0 2 0 2;0 0 1 1 1 0 2;0 0 1 1 2 0 0;1 1 0 1 0 0 1;0 1 1 1 2 0 0;1 1 1 0 0 0 2;1 0 1 1 2 0 2;0 1 0 0 2 0 2;0 1 1 1 2 0 1;1 0 0 0 2 0 2;1 1 1 1 0 0 2;0 0 1 1 2 0 0;1 0 1 1 2 1 2;0 0 1 1 1 0 2;1 1 1 1 0 0 2;0 0 1 1 1 0 0;0 0 1 1 2 0 2;1 1 0 1 0 0 2;0 0 1 1 2 0 2;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 0 1 1 2 0 1;0 0 1 1 0 0 2;1 1 1 1 0 0 2;];
Everton_G = Everton_NBC;
Everton_G(:,3)=[];Everton_G(:,4)=[];
EvertonY = Everton_G(:,5); %get our class variable
Everton_G = Everton_G(:,1:4)'; %features are now displayed correct way

EvertonW = EvertonY; %new array to begin first binary classification
EvertonW(EvertonW==1)=0; %change all draws to a 0
EvertonW(EvertonW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (EvertonW) / size (EvertonW,1); %get probability of a win
pNW = sum (1-EvertonW) / size (EvertonW,1); %get probability of other results

%P(x_i|Y):
phiW = Everton_G * EvertonW / sum(EvertonW); %all instances where (i) = 1 and there is a win
phiNW = Everton_G * (1-EvertonW) / sum(1-EvertonW); %all instances where (i) = 0 and its another result

%test point
EvertonX = [0 0 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXW = prod(phiW.^EvertonX.*(1-phiW).^(1-EvertonX));
pEvertonXNW = prod(phiNW.^EvertonX.*(1-phiNW).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXWF = (pEvertonXW * pW ) / (pEvertonXW + pEvertonXNW); %Y=1
pxEvertonXNWF = (pEvertonXNW * pW ) / (pEvertonXW + pEvertonXNW); %Y=0

EvertonD = EvertonY; %new array to begin second binary classification
EvertonD(EvertonD==2)=0; %change all wins to a 0

pD = sum (EvertonD) / size (EvertonD,1); %probability of a draw
pND = sum (1-EvertonD) / size (EvertonD,1); %probability of not drawing

%P(x_i|Y):
phiD = Everton_G * EvertonD / sum(EvertonD); %all instances where (i) = 1 and there is a win
phiND = Everton_G * (1-EvertonD) / sum(1-EvertonD); %all instances where (i) = 0 and its another result

%test point
EvertonX = [0 0 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXD = prod(phiD.^EvertonX.*(1-phiD).^(1-EvertonX));
pEvertonXND = prod(phiND.^EvertonX.*(1-phiND).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXDF = (pEvertonXD * pD ) / (pEvertonXD + pEvertonXND); %Y=1
pEvertonXNDF = (pEvertonXND * pD ) / (pEvertonXD + pEvertonXND); %Y=0

EvertonL = EvertonY; %new array to begin second binary classification
EvertonL(EvertonL==1)=3; %change all draws to a 3
EvertonL(EvertonL==0)=1; %change all losses to a 1
EvertonL(EvertonL==2)=0; %change all wins to a 0
EvertonL(EvertonL==3)=0; %change all draws to a 0

pL = sum (EvertonL) / size (EvertonL,1); %probability of a draw
pNL = sum (1-EvertonL) / size (EvertonL,1); %probability of not drawing

%P(x_i|Y):
phiL = Everton_G * EvertonL / sum(EvertonL); %all instances where (i) = 1 and there is a win
phiNL = Everton_G * (1-EvertonL) / sum(1-EvertonL); %all instances where (i) = 0 and its another result

%test point
EvertonX = [0 0 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pEvertonXL = prod(phiL.^EvertonX.*(1-phiL).^(1-EvertonX));
pEvertonXNL = prod(phiNL.^EvertonX.*(1-phiNL).^(1-EvertonX));

%P(Y=1|X) & P(Y=0|X):
pEvertonXLF = (pEvertonXL * pL ) / (pEvertonXL + pEvertonXNL); %Y=1
pxEvertonXNLF = (pEvertonXNL * pL ) / (pEvertonXL + pEvertonXNL); %Y=0

%voting system chooses the probability with highest value
Win = pEvertonXWF;
Draw = pEvertonXDF;
Lose = pEvertonXLF;
Everton_Probs = [Win, Draw, Lose];
Everton_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Everton_Probs);


Everton_str2 = ['Arsenal vs Everton: Arsenal will ',Everton_Probs_name{ind}];
disp(Everton_str2)
%--------------------------------------------------------------------------------------%
%Our training data
West_Ham_NBC = [0 0 1 1 1 1 2;1 0 1 1 0 0 2;0 1 1 1 0 0 2;0 1 1 1 1 0 2;1 1 1 1 2 0 2;1 0 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 1 0 1;0 1 1 1 1 0 2;1 0 1 1 2 0 2;0 1 1 1 2 0 2;1 0 1 1 2 0 0;0 1 1 1 1 0 0;1 1 1 1 0 0 0;0 0 0 0 2 0 1;1 0 1 1 0 0 2;0 0 1 1 2 0 1;1 0 1 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 2 0 2;0 1 1 1 2 0 2;1 0 1 1 0 1 2;0 1 1 0 2 0 0;0 0 0 1 2 0 2;1 0 0 1 2 0 2;0 1 1 1 2 0 1;1 0 1 1 2 0 2;0 0 1 1 2 0 2;0 0 1 1 2 0 2;];
West_Ham_G = West_Ham_NBC;
West_Ham_G(:,3)=[];West_Ham_G(:,4)=[];
West_HamY = West_Ham_G(:,5); %get our class variable
West_Ham_G = West_Ham_G(:,1:4)'; %features are now displayed correct way

West_HamW = West_HamY; %new array to begin first binary classification
West_HamW(West_HamW==1)=0; %change all draws to a 0
West_HamW(West_HamW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (West_HamW) / size (West_HamW,1); %get probability of a win
pNW = sum (1-West_HamW) / size (West_HamW,1); %get probability of other results

%P(x_i|Y):
phiW = West_Ham_G * West_HamW / sum(West_HamW); %all instances where (i) = 1 and there is a win
phiNW = West_Ham_G * (1-West_HamW) / sum(1-West_HamW); %all instances where (i) = 0 and its another result

%test point
West_HamX = [1 0 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXW = prod(phiW.^West_HamX.*(1-phiW).^(1-West_HamX));
pWest_HamXNW = prod(phiNW.^West_HamX.*(1-phiNW).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXWF = (pWest_HamXW * pW ) / (pWest_HamXW + pWest_HamXNW); %Y=1
pWest_HamXNWF = (pWest_HamXNW * pW ) / (pWest_HamXW + pWest_HamXNW); %Y=0

West_HamD = West_HamY; %new array to begin second binary classification
West_HamD(West_HamD==2)=0; %change all wins to a 0

pD = sum (West_HamD) / size (West_HamD,1); %probability of a draw
pND = sum (1-West_HamD) / size (West_HamD,1); %probability of not drawing

%P(x_i|Y):
phiD = West_Ham_G * West_HamD / sum(West_HamD); %all instances where (i) = 1 and there is a win
phiND = West_Ham_G * (1-West_HamD) / sum(1-West_HamD); %all instances where (i) = 0 and its another result

%test point
West_HamX = [1 0 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXD = prod(phiD.^West_HamX.*(1-phiD).^(1-West_HamX));
pWest_HamXND = prod(phiND.^West_HamX.*(1-phiND).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXDF = (pWest_HamXD * pD ) / (pWest_HamXD + pWest_HamXND); %Y=1
pWest_HamXNDF = (pWest_HamXND * pD ) / (pWest_HamXD + pWest_HamXND); %Y=0

West_HamL = West_HamY; %new array to begin second binary classification
West_HamL(West_HamL==1)=3; %change all draws to a 3
West_HamL(West_HamL==0)=1; %change all losses to a 1
West_HamL(West_HamL==2)=0; %change all wins to a 0
West_HamL(West_HamL==3)=0; %change all draws to a 0

pL = sum (West_HamL) / size (West_HamL,1); %probability of a draw
pNL = sum (1-West_HamL) / size (West_HamL,1); %probability of not drawing

%P(x_i|Y):
phiL = West_Ham_G * West_HamL / sum(West_HamL); %all instances where (i) = 1 and there is a win
phiNL = West_Ham_G * (1-West_HamL) / sum(1-West_HamL); %all instances where (i) = 0 and its another result

%test point
West_HamX = [1 0 0 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_HamXL = prod(phiL.^West_HamX.*(1-phiL).^(1-West_HamX));
pWest_HamXNL = prod(phiNL.^West_HamX.*(1-phiNL).^(1-West_HamX));

%P(Y=1|X) & P(Y=0|X):
pWest_HamXLF = (pWest_HamXL * pL ) / (pWest_HamXL + pWest_HamXNL); %Y=1
pWest_HamXNLF = (pWest_HamXNL * pL ) / (pWest_HamXL + pWest_HamXNL); %Y=0

%voting system chooses the probability with highest value
Win = pWest_HamXWF;
Draw = pWest_HamXDF;
Lose = pWest_HamXLF;
West_Ham_Probs = [Win, Draw, Lose];
West_Ham_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(West_Ham_Probs);


West_Ham_str2 = ['Arsenal vs West Ham: Arsenal will ',West_Ham_Probs_name{ind}];
disp(West_Ham_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Hull_NBC = [1 0 1 1 2 0 2;0 1 1 1 2 0 2;1 0 1 1 1 0 2;0 0 1 1 2 0 2;1 1 1 1 2 0 0;];
Hull_G = Hull_NBC;
Hull_G(:,3)=[];Hull_G(:,4)=[];
HullY = Hull_G(:,5); %get our class variable
Hull_G = Hull_G(:,1:4)'; %features are now displayed correct way

HullW = HullY; %new array to begin first binary classification
HullW(HullW==1)=0; %change all draws to a 0
HullW(HullW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (HullW) / size (HullW,1); %get probability of a win
pNW = sum (1-HullW) / size (HullW,1); %get probability of other results

%P(x_i|Y):
phiW = Hull_G * HullW / sum(HullW); %all instances where (i) = 1 and there is a win
phiNW = Hull_G * (1-HullW) / sum(1-HullW); %all instances where (i) = 0 and its another result

%test point
HullX = [0 0 2 0]'; %the next game to predict

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
phiD = Hull_G * HullD / sum(HullD); %all instances where (i) = 1 and there is a win
phiND = Hull_G * (1-HullD) / sum(1-HullD); %all instances where (i) = 0 and its another result

%test point
HullX = [0 0 2 0]'; %the next game to predict

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
phiL = Hull_G * HullL / sum(HullL); %all instances where (i) = 1 and there is a win
phiNL = Hull_G * (1-HullL) / sum(1-HullL); %all instances where (i) = 0 and its another result

%test point
HullX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pHullXL = prod(phiL.^HullX.*(1-phiL).^(1-HullX));
pHullXNL = prod(phiNL.^HullX.*(1-phiNL).^(1-HullX));

%P(Y=1|X) & P(Y=0|X):
pHullXLF = (pHullXL * pL ) / (pHullXL + pHullXNL); %Y=1
pHullXNLF = (pHullXNL * pL ) / (pHullXL + pHullXNL); %Y=0

%voting system chooses the probability with highest value
Win = pHullXWF;
Draw = pHullXDF;
Lose = pHullXLF;
Hull_Probs = [Win, Draw, Lose];
Hull_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Hull_Probs);


Hull_str2 = ['Arsenal vs Hull: Arsenal will ',Hull_Probs_name{ind}];
disp(Hull_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Newcastle_NBC = [0 1 1 0 2 0 2;0 0 1 1 2 0 2;1 0 1 1 2 0 2;1 1 1 1 2 0 2;0 0 0 0 1 0 1;0 0 1 1 2 0 1;1 1 1 1 2 0 0;0 1 1 1 2 0 2;1 1 0 0 0 0 2;1 1 1 1 2 0 2;0 0 1 1 2 0 1;0 0 1 1 0 0 1;1 0 1 1 2 0 1;0 1 1 1 0 0 0;1 1 0 0 0 0 2;1 0 1 1 0 0 2;0 0 1 1 2 0 2;0 0 1 1 2 0 1;1 0 1 1 1 1 2;0 0 1 1 2 0 1;1 1 1 1 2 0 2;0 1 1 1 2 0 2;1 0 1 1 1 0 0;0 1 1 1 2 0 1;1 1 1 1 2 0 2;0 0 1 1 1 0 0;1 1 0 1 2 0 1;0 1 0 1 2 0 1;1 1 0 1 0 0 2;1 1 1 1 2 0 2;0 0 1 0 0 0 2;1 0 0 1 0 1 0;0 1 1 1 2 0 2;];
Newcastle_G = Newcastle_NBC;
Newcastle_G(:,3)=[];Newcastle_G(:,4)=[];
NewcastleY = Newcastle_G(:,5); %get our class variable
Newcastle_G = Newcastle_G(:,1:4)'; %features are now displayed correct way

NewcastleW = NewcastleY; %new array to begin first binary classification
NewcastleW(NewcastleW==1)=0; %change all draws to a 0
NewcastleW(NewcastleW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (NewcastleW) / size (NewcastleW,1); %get probability of a win
pNW = sum (1-NewcastleW) / size (NewcastleW,1); %get probability of other results

%P(x_i|Y):
phiW = Newcastle_G * NewcastleW / sum(NewcastleW); %all instances where (i) = 1 and there is a win
phiNW = Newcastle_G * (1-NewcastleW) / sum(1-NewcastleW); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNewcastleXW = prod(phiW.^NewcastleX.*(1-phiW).^(1-NewcastleX));
pNewcastleXNW = prod(phiNW.^NewcastleX.*(1-phiNW).^(1-NewcastleX));

%P(Y=1|X) & P(Y=0|X):
pNewcastleXWF = (pNewcastleXW * pW ) / (pNewcastleXW + pNewcastleXNW); %Y=1
pNewcastleXNWF = (pNewcastleXNW * pW ) / (pNewcastleXW + pNewcastleXNW); %Y=0

NewcastleD = NewcastleY; %new array to begin second binary classification
NewcastleD(NewcastleD==2)=0; %change all wins to a 0

pD = sum (NewcastleD) / size (NewcastleD,1); %probability of a draw
pND = sum (1-NewcastleD) / size (NewcastleD,1); %probability of not drawing

%P(x_i|Y):
phiD = Newcastle_G * NewcastleD / sum(NewcastleD); %all instances where (i) = 1 and there is a win
phiND = Newcastle_G * (1-NewcastleD) / sum(1-NewcastleD); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNewcastleXD = prod(phiD.^NewcastleX.*(1-phiD).^(1-NewcastleX));
pNewcastleXND = prod(phiND.^NewcastleX.*(1-phiND).^(1-NewcastleX));

%P(Y=1|X) & P(Y=0|X):
pNewcastleXDF = (pNewcastleXD * pD ) / (pNewcastleXD + pNewcastleXND); %Y=1
pNewcastleXNDF = (pNewcastleXND * pD ) / (pNewcastleXD + pNewcastleXND); %Y=0

NewcastleL = NewcastleY; %new array to begin second binary classification
NewcastleL(NewcastleL==1)=3; %change all draws to a 3
NewcastleL(NewcastleL==0)=1; %change all losses to a 1
NewcastleL(NewcastleL==2)=0; %change all wins to a 0
NewcastleL(NewcastleL==3)=0; %change all draws to a 0

pL = sum (NewcastleL) / size (NewcastleL,1); %probability of a draw
pNL = sum (1-NewcastleL) / size (NewcastleL,1); %probability of not drawing

%P(x_i|Y):
phiL = Newcastle_G * NewcastleL / sum(NewcastleL); %all instances where (i) = 1 and there is a win
phiNL = Newcastle_G * (1-NewcastleL) / sum(1-NewcastleL); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNewcastleXL = prod(phiL.^NewcastleX.*(1-phiL).^(1-NewcastleX));
pNewcastleXNL = prod(phiNL.^NewcastleX.*(1-phiNL).^(1-NewcastleX));

%P(Y=1|X) & P(Y=0|X):
pNewcastleXLF = (pNewcastleXL * pL ) / (pNewcastleXL + pNewcastleXNL); %Y=1
pNewcastleXNLF = (pNewcastleXNL * pL ) / (pNewcastleXL + pNewcastleXNL); %Y=0

%voting system chooses the probability with highest value
Win = pNewcastleXWF;
Draw = pNewcastleXDF;
Lose = pNewcastleXLF;
Newcastle_Probs = [Win, Draw, Lose];
Newcastle_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Newcastle_Probs);


Newcastle_str2 = ['Arsenal vs Newcastle: Arsenal will ',Newcastle_Probs_name{ind}];
disp(Newcastle_str2)
%---------------------------------------------------------------------------------------%
%Our training data
West_Brom_NBC = [0 1 1 1 2 0 1;0 0 1 1 2 0 2;1 1 0 1 0 0 2;0 0 1 1 1 0 2;1 1 1 0 2 0 2;0 1 1 1 1 0 1;1 1 1 1 1 0 0;0 0 1 1 1 0 2;1 1 0 0 2 0 2;1 0 1 1 1 0 2;0 0 1 1 2 0 0;0 0 1 1 2 0 2;1 0 1 1 2 0 1;0 0 1 1 2 0 2;1 0 1 1 1 0 2;];
West_Brom_G = West_Brom_NBC;
West_Brom_G(:,3)=[];West_Brom_G(:,4)=[];
West_BromY = West_Brom_G(:,5); %get our class variable
West_Brom_G = West_Brom_G(:,1:4)'; %features are now displayed correct way

West_BromW = West_BromY; %new array to begin first binary classification
West_BromW(West_BromW==1)=0; %change all draws to a 0
West_BromW(West_BromW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (West_BromW) / size (West_BromW,1); %get probability of a win
pNW = sum (1-West_BromW) / size (West_BromW,1); %get probability of other results

%P(x_i|Y):
phiW = West_Brom_G * West_BromW / sum(West_BromW); %all instances where (i) = 1 and there is a win
phiNW = West_Brom_G * (1-West_BromW) / sum(1-West_BromW); %all instances where (i) = 0 and its another result

%test point
West_BromX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXW = prod(phiW.^West_BromX.*(1-phiW).^(1-West_BromX));
pWest_BromXNW = prod(phiNW.^West_BromX.*(1-phiNW).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXWF = (pWest_BromXW * pW ) / (pWest_BromXW + pWest_BromXNW); %Y=1
pWest_BromXNWF = (pWest_BromXNW * pW ) / (pWest_BromXW + pWest_BromXNW); %Y=0

West_BromD = West_BromY; %new array to begin second binary classification
West_BromD(West_BromD==2)=0; %change all wins to a 0

pD = sum (West_BromD) / size (West_BromD,1); %probability of a draw
pND = sum (1-West_BromD) / size (West_BromD,1); %probability of not drawing

%P(x_i|Y):
phiD = West_Brom_G * West_BromD / sum(West_BromD); %all instances where (i) = 1 and there is a win
phiND = West_Brom_G * (1-West_BromD) / sum(1-West_BromD); %all instances where (i) = 0 and its another result

%test point
West_BromX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXD = prod(phiD.^West_BromX.*(1-phiD).^(1-West_BromX));
pWest_BromXND = prod(phiND.^West_BromX.*(1-phiND).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXDF = (pWest_BromXD * pD ) / (pWest_BromXD + pWest_BromXND); %Y=1
pWest_BromXNDF = (pWest_BromXND * pD ) / (pWest_BromXD + pWest_BromXND); %Y=0

West_BromL = West_BromY; %new array to begin second binary classification
West_BromL(West_BromL==1)=3; %change all draws to a 3
West_BromL(West_BromL==0)=1; %change all losses to a 1
West_BromL(West_BromL==2)=0; %change all wins to a 0
West_BromL(West_BromL==3)=0; %change all draws to a 0

pL = sum (West_BromL) / size (West_BromL,1); %probability of a draw
pNL = sum (1-West_BromL) / size (West_BromL,1); %probability of not drawing

%P(x_i|Y):
phiL = West_Brom_G * West_BromL / sum(West_BromL); %all instances where (i) = 1 and there is a win
phiNL = West_Brom_G * (1-West_BromL) / sum(1-West_BromL); %all instances where (i) = 0 and its another result

%test point
West_BromX = [1 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pWest_BromXL = prod(phiL.^West_BromX.*(1-phiL).^(1-West_BromX));
pWest_BromXNL = prod(phiNL.^West_BromX.*(1-phiNL).^(1-West_BromX));

%P(Y=1|X) & P(Y=0|X):
pWest_BromXLF = (pWest_BromXL * pL ) / (pWest_BromXL + pWest_BromXNL); %Y=1
pWest_BromXNLF = (pWest_BromXNL * pL ) / (pWest_BromXL + pWest_BromXNL); %Y=0

%voting system chooses the probability with highest value
Win = pWest_BromXWF;
Draw = pWest_BromXDF;
Lose = pWest_BromXLF;
West_Brom_Probs = [Win, Draw, Lose];
West_Brom_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(West_Brom_Probs);


West_Brom_str2 = ['Arsenal vs West Brom: Arsenal will ',West_Brom_Probs_name{ind}];
disp(West_Brom_str2)
%---------------------------------------------------------------------------------------%
%Our training data
Norwich_NBC = [1 0 1 1 1 0 2;1 0 1 1 2 0 2;0 0 1 1 2 0 0;1 0 1 1 1 0 1;0 0 1 0 2 0 2;1 0 1 1 2 0 2;0 0 1 1 2 0 2;];
Norwich_G = Norwich_NBC;
Norwich_G(:,3) = [];Norwich_G(:,4) = [];
NorwichY = Norwich_G(:,5); %get our class variable
Norwich_G = Norwich_G(:,1:4)'; %features are now displayed correct way

NorwichW = NorwichY; %new array to begin first binary classification
NorwichW(NorwichW==1)=0; %change all draws to a 0
NorwichW(NorwichW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (NorwichW) / size (NorwichW,1); %get probability of a win
pNW = sum (1-NorwichW) / size (NorwichW,1); %get probability of other results

%P(x_i|Y):
phiW = Norwich_G * NorwichW / sum(NorwichW); %all instances where (i) = 1 and there is a win
phiNW = Norwich_G * (1-NorwichW) / sum(1-NorwichW); %all instances where (i) = 0 and its another result

%test point
NorwichX = [0 0 2 0]'; %the next game to predict

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
phiD = Norwich_G * NorwichD / sum(NorwichD); %all instances where (i) = 1 and there is a win
phiND = Norwich_G * (1-NorwichD) / sum(1-NorwichD); %all instances where (i) = 0 and its another result

%test point
NorwichX = [0 0 2 0]'; %the next game to predict

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
phiL = Norwich_G * NorwichL / sum(NorwichL); %all instances where (i) = 1 and there is a win
phiNL = Norwich_G * (1-NorwichL) / sum(1-NorwichL); %all instances where (i) = 0 and its another result

%test point
NorwichX = [0 0 2 0]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNorwichXL = prod(phiL.^NorwichX.*(1-phiL).^(1-NorwichX));
pNorwichXNL = prod(phiNL.^NorwichX.*(1-phiNL).^(1-NorwichX));

%P(Y=1|X) & P(Y=0|X):
pNorwichXLF = (pNorwichXL * pL ) / (pNorwichXL + pNorwichXNL); %Y=1
pNorwichXNLF = (pNorwichXNL * pL ) / (pNorwichXL + pNorwichXNL); %Y=0

%voting system chooses the probability with highest value
Win = pNorwichXWF;
Draw = pNorwichXDF;
Lose = pNorwichXLF;
Norwich_Probs = [Win, Draw, Lose];
Norwich_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Norwich_Probs);


Norwich_str2 = ['Arsenal vs Norwich: Arsenal will ',Norwich_Probs_name{ind}];
disp(Norwich_str2)

%---------------------------------------------------------------------------------%
NB_Results_Array_GSGC = {Aston_Villa_str;Fulham_str;Tottenham_str;Sunderland_str;Stoke_str;Swansea_str;West_Brom_str;Norwich_str;'Arsenal vs Crystal Palace could not be predicted';Liverpool_str;Man_United_str;Southampton_str;'Arsenal vs Cardiff City could not be predicted';Hull_str;Everton_str;Man_City_str;Chelsea_str;West_Ham_str;Newcastle_str;'Arsenal vs Cardiff City could not be predicted';Aston_Villa_str2;Fulham_str2;Southampton_str2;'Arsenal vs Crystal Palace could not be predicted';Liverpool_str2;Man_United_str2;Sunderland_str2;Stoke_str2;Tottenham_str2;Chelsea_str2;Swansea_str2;Man_City_str2;Everton_str2;West_Ham_str2;Hull_str2;Newcastle_str2;West_Brom_str2;Norwich_str2;};

end

