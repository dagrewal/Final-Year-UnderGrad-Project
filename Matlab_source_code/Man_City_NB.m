%Our training data
Man_City_NBC = [1 1 0 0 0;0 1 0 1 1;1 0 0 0 2;0 0 0 0 0;1 0 1 0 1;0 1 1 0 2;1 0 1 1 1;0 0 1 0 0;1 0 1 1 2;0 0 0 1 0;0 0 1 1 2;1 0 0 0 2;1 0 1 1 2;0 1 0 1 0;0 0 1 1 2;1 1 0 1 2;1 0 1 0 1;0 0 1 0 2;1 1 1 1 2;0 0 1 1 2;0 1 1 1 2;1 0 1 0 2;0 1 1 1 2;1 1 1 1 2;];

Man_CityY = Man_City_NBC(:,5); %get our class variable
Man_City_NBC = Man_City_NBC(:,1:4)'; %features are now displayed correct way

Man_CityW = Man_CityY; %new array to begin first binary classification
Man_CityW(Man_CityW==1)=0; %change all draws to a 0
Man_CityW(Man_CityW==2)=1; %change all wins to a 1

%P(Y):
pW = sum (Man_CityW) / size (Man_CityW,1); %get probability of a win
pNW = sum (1-Man_CityW) / size (Man_CityW,1); %get probability of other results

%P(x_i|Y):
phiW = Man_City_NBC * Man_CityW / sum(Man_CityW); %all instances where (i) = 1 and there is a win
phiNW = Man_City_NBC * (1-Man_CityW) / sum(1-Man_CityW); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [1 1 1 1]'; %the next game to predict

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
phiD = Man_City_NBC * Man_CityD / sum(Man_CityD); %all instances where (i) = 1 and there is a win
phiND = Man_City_NBC * (1-Man_CityD) / sum(1-Man_CityD); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [1 1 1 1]'; %the next game to predict

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
phiL = Man_City_NBC * Man_CityL / sum(Man_CityL); %all instances where (i) = 1 and there is a win
phiNL = Man_City_NBC * (1-Man_CityL) / sum(1-Man_CityL); %all instances where (i) = 0 and its another result

%test point
Man_CityX = [1 1 1 1]'; %the next game to predict

%P(X|Y = 1) & P(X|Y=0):
pMan_CityXL = prod(phiL.^Man_CityX.*(1-phiL).^(1-Man_CityX));
pMan_CityXNL = prod(phiNL.^Man_CityX.*(1-phiNL).^(1-Man_CityX));

%P(Y=1|X) & P(Y=0|X):
pMan_CityXLF = (pMan_CityXL * pL ) / (pMan_CityXL + pMan_CityXNL); %Y=1
pMan_CityXNLF = (pMan_CityXNL * pL ) / (pMan_CityXL + pMan_CityXNL); %Y=0

%voting system chooses the probability with highest value
Win = pMan_CityXW;
Draw = pMan_CityXD;
Lose = pMan_CityXL;
Man_City_Probs = [Win, Draw, Lose];
Man_City_Probs_name = {'Win','Draw','Lose'};

[maximum,ind] = max(Man_City_Probs);

Man_City_str = ['Arsenal vs Man City: Arsenal will ',Man_City_Probs_name{ind}];
disp(Man_City_str)




