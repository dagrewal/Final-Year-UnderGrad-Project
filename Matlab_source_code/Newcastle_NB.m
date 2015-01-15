%Our training data
Newcastle_NBC = [0 0 1 1 2;1 0 1 1 2;1 1 1 1 2;0 0 0 0 1;0 0 1 1 1;1 1 1 1 0;0 1 1 1 2;1 1 0 0 2;1 1 1 1 2;0 0 1 1 1;0 0 1 1 1;1 0 1 1 1;0 1 1 1 0;1 1 0 0 2;1 0 1 1 2;0 0 1 1 2;0 0 1 1 1;1 0 1 1 2;0 0 1 1 1;1 1 1 1 2;0 1 1 1 2;1 0 1 1 0;0 1 1 1 1;1 1 1 1 2;0 0 1 1 0;1 1 0 1 1;0 1 0 1 1;1 1 0 1 2;1 1 1 1 2;0 0 1 0 2;1 0 0 1 0;0 1 1 1 2;];
NewcastleY = Newcastle_NBC(:,5); %get our class variable
Newcastle_NBC = Newcastle_NBC(:,1:4)'; %features are now displayed correct way

NewcastleW = NewcastleY; %new array to begin first binary classification
NewcastleW(NewcastleW==1)=0; %change all draws to a 0
NewcastleW(NewcastleW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (NewcastleW) / size (NewcastleW,1); %get probability of a win
pNW = sum (1-NewcastleW) / size (NewcastleW,1); %get probability of other results

%P(x_i|Y):
phiW = Newcastle_NBC * NewcastleW / sum(NewcastleW); %all instances where (i) = 1 and there is a win
phiNW = Newcastle_NBC * (1-NewcastleW) / sum(1-NewcastleW); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [1 1 1 1]'; %the next game to predict

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
phiD = Newcastle_NBC * NewcastleD / sum(NewcastleD); %all instances where (i) = 1 and there is a win
phiND = Newcastle_NBC * (1-NewcastleD) / sum(1-NewcastleD); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [1 1 1 1]'; %the next game to predict

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
phiL = Newcastle_NBC * NewcastleL / sum(NewcastleL); %all instances where (i) = 1 and there is a win
phiNL = Newcastle_NBC * (1-NewcastleL) / sum(1-NewcastleL); %all instances where (i) = 0 and its another result

%test point
NewcastleX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pNewcastleXL = prod(phiL.^NewcastleX.*(1-phiL).^(1-NewcastleX));
pNewcastleXNL = prod(phiNL.^NewcastleX.*(1-phiNL).^(1-NewcastleX));

%P(Y=1|X) & P(Y=0|X):
pNewcastleXLF = (pNewcastleXL * pL ) / (pNewcastleXL + pNewcastleXNL); %Y=1
pNewcastleXNLF = (pNewcastleXNL * pL ) / (pNewcastleXL + pNewcastleXNL); %Y=0

%voting system chooses the probability with highest value
Win = pNewcastleXW;
Draw = pNewcastleXD;
Lose = pMan_UnitedXL;
Newcastle_Probs = [Win, Draw, Lose];
Newcastle_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Newcastle_Probs);

Newcastle_str = ['Arsenal vs Newcastle: Arsenal will ',Newcastle_Probs_name{ind}];
disp(Newcastle_str)




