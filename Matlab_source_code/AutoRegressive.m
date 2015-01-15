function [ AR_string ] = AutoRegressive( input_args )
%the autoregressive process. there are 4 lags with paramters, therefore I
%have made a AR 4 Process. the results are concatenated into a string
%below. See Matlab help documentation on arima for more info.
data = [1;1;0;0;2;2;1;2;1;2;2;2;1;2;2;2;2;1;2;1;2;2;1;0;1;2;1;2;0;2;2;1;2;]; %data for predicting 1st meeting of season
data2 = [1;1;0;0;2;2;1;2;1;2;2;2;1;2;2;2;2;1;2;1;2;2;1;0;1;2;1;2;0;2;2;1;2;0;]; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

AstonVillaAR_str = Y;
AstonVillaAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if AstonVillaAR_str < 0.5
    AstonVillaR = ('Arsenal will lose');
 
elseif (0.5 <= AstonVillaAR_str) && (AstonVillaAR_str < 1.5)
    AstonVillaR = ('Arsenal will draw');
    
elseif AstonVillaAR_str >= 1.5
    AstonVillaR = ('Arsenal will win');
   
end;
%if statement to predict result of 2nd meeting
if AstonVillaAR_str2 < 0.5
    AstonVillaR2 = ('Arsenal will lose');
   
elseif (0.5 <= AstonVillaAR_str2) && (AstonVillaAR_str2 < 1.5)
    AstonVillaR2 = ('Arsenal will draw');
    
elseif AstonVillaAR_str2 >= 1.5
    AstonVillaR2 = ('Arsenal will win');
    
end;

data = [2;2;2;1;2;2;2;1;1;1;2;1;2;2;2;1;1;0;0;1;1;2;0;2;0;0;0;0;2;2;1;0;0;]; %data for predicting 1st meeting of season
data2 = [2;2;2;1;2;2;2;1;1;1;2;1;2;2;2;1;1;0;0;1;1;2;0;2;0;0;0;0;2;2;1;0;0;1;]; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

ChelseaAR_str = Y;
ChelseaAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if ChelseaAR_str < 0.5
    ChelseaR = ('Arsenal will lose');
    
elseif (0.5 <= ChelseaAR_str) && (ChelseaAR_str < 1.5)
    ChelseaR = ('Arsenal will draw');
    
elseif ChelseaAR_str >= 1.5
    ChelseaR = ('Arsenal will win');
   
end;
%if statement to predict result of 2nd meeting
if ChelseaAR_str2 < 0.5
    ChelseaR2 = ('Arsenal will lose');
    
elseif (0.5 <= ChelseaAR_str2) && (ChelseaAR_str2 < 1.5)
    ChelseaR2 = ('Arsenal will draw');
    
elseif ChelseaAR_str2 >= 1.5
    ChelseaR2 = ('Arsenal will win');
    
end;

data = [2 2 1 2 2 2 2 2 0 2 2 2 0 2 2 1 2 2 2 0 1 0 2 2 2 1 2 1 2 2 2 2 1 1]'; %data for predicting 1st meeting of season
data2 = [2 2 1 2 2 2 2 2 0 2 2 2 0 2 2 1 2 2 2 0 1 0 2 2 2 1 2 1 2 2 2 2 1 1 1]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

EvertonAR_str = Y;
EvertonAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if EvertonAR_str < 0.5
    EvertonR = ('Arsenal will lose');
    
elseif (0.5 <= EvertonAR_str) && (EvertonAR_str < 1.5)
    EvertonR = ('Arsenal will draw');
    
elseif EvertonAR_str >= 1.5
    EvertonR = ('Arsenal will win');
 
end;
%if statement to predict result of 2nd meeting
if EvertonAR_str2 < 0.5
    EvertonR2 = ('Arsenal will lose');
    
elseif (0.5 <= EvertonAR_str2) && (EvertonAR_str2 < 1.5)
    EvertonR2 = ('Arsenal will draw');
    
elseif EvertonAR_str2 >= 1.5
    EvertonR2 = ('Arsenal will win');
    
end;

data = [2 2 2 2 1 2 2 2 2 2 0 2 2 2 0 1 2 2 2 1 1 0 1 2]'; %data for predicting 1st meeting of season
data2 = [2 2 2 2 1 2 2 2 2 2 0 2 2 2 0 1 2 2 2 1 1 0 1 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

FulhamAR_str = Y;
FulhamAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if FulhamAR_str < 0.5
    FulhamR = ('Arsenal will lose');
    
elseif (0.5 <= FulhamAR_str) && (FulhamAR_str < 1.5)
    FulhamR = ('Arsenal will draw');
    
elseif FulhamAR_str >= 1.5
    FulhamR = ('Arsenal will win');
    
end;
%if statement to predict result of 2nd meeting
if FulhamAR_str2 < 0.5
    FulhamR2 = ('Arsenal will lose');
    
elseif (0.5 <= FulhamAR_str2) && (FulhamAR_str2 < 1.5)
    FulhamR2 = ('Arsenal will draw');
    
elseif FulhamAR_str2 >= 1.5
    FulhamR2 = ('Arsenal will win');
   
end;

data = [0 0 0 1 1 0 0 2 0 2 1 1 1 2 2 0 2 0 2 2 0 1 1 1 1 2 2 1 1 0 2 2 1]'; %data for predicting 1st meeting of season
data2 = [0 0 0 1 1 0 0 2 0 2 1 1 1 2 2 0 2 0 2 2 0 1 1 1 1 2 2 1 1 0 2 2 1 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

LiverpoolAR_str = Y;
LiverpoolAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if LiverpoolAR_str < 0.5
    LiverpoolR = ('Arsenal will lose');
    disp(LiverpoolR)
elseif (0.5 <= LiverpoolAR_str) && (LiverpoolAR_str < 1.5)
    LiverpoolR = ('Arsenal will draw');
    
elseif LiverpoolAR_str >= 1.5
    LiverpoolR = ('Arsenal will win');
    
end;
%if statement to predict result of 2nd meeting
if LiverpoolAR_str2 < 0.5
    LiverpoolR2 = ('Arsenal will lose');
    
elseif (0.5 <= LiverpoolAR_str2) && (LiverpoolAR_str2 < 1.5)
    LiverpoolR2 = ('Arsenal will draw');
   
elseif LiverpoolAR_str2 >= 1.5
    LiverpoolR2 = ('Arsenal will win');
    
end;

data = [2 2 2 2 2 2 2 1 2 2 0 2 2 2 0 2 0 1 2 1 0 2 1 0]'; %data for predicting 1st meeting of season
data2 = [2 2 2 2 2 2 2 1 2 2 0 2 2 2 0 2 0 1 2 1 0 2 1 0 0]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

ManCityAR_str = Y;
ManCityAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if ManCityAR_str < 0.5
    ManCityR = ('Arsenal will lose');
    
elseif (0.5 <= ManCityAR_str) && (ManCityAR_str < 1.5)
    ManCityR = ('Arsenal will draw');
    
elseif ManCityAR_str >= 1.5
    ManCityR = ('Arsenal will win');
  
end;
%if statement to predict result of 2nd meeting
if ManCityAR_str2 < 0.5
    ManCityR2 = ('Arsenal will lose');
   
elseif (0.5 <= ManCityAR_str2) && (ManCityAR_str2 < 1.5)
    ManCityR2 = ('Arsenal will draw');
    
elseif ManCityAR_str2 >= 1.5
    ManCityR2 = ('Arsenal will win');
    
end;

data = [0 0 2 2 2 1 0 1 2 0 2 2 0 1 1 1 0 0 1 0 2 1 0 0 0 2 0 0 0 1]'; %data for predicting 1st meeting of season
data2 = [0 0 2 2 2 1 0 1 2 0 2 2 0 1 1 1 0 0 1 0 2 1 0 0 0 2 0 0 0 1 0]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

ManUtdAR_str = Y;
ManUtdAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if ManUtdAR_str < 0.5
    ManUtdR = ('Arsenal will lose');
   
elseif (0.5 <= ManUtdAR_str) && (ManUtdAR_str < 1.5)
    ManUtdR = ('Arsenal will draw');
  
elseif ManUtdAR_str >= 1.5
    ManUtdR = ('Arsenal will win');
    
end;
%if statement to predict result of 2nd meeting
if ManUtdAR_str2 < 0.5
    ManUtdR2 = ('Arsenal will lose');
    
elseif (0.5 <= ManUtdAR_str2) && (ManUtdAR_str2 < 1.5)
    ManUtdR2 = ('Arsenal will draw');
    
elseif ManUtdAR_str2 >= 1.5
    ManUtdR2 = ('Arsenal will win');
    
end;

data = [2 0 2 2 2 1 1 0 2 1 0 2 2 1 2 1 2 2 2 0 1 1 1 2 2 2 0 1 1 2 2 2]'; %data for predicting 1st meeting of season
data2 = [2 0 2 2 2 1 1 0 2 1 0 2 2 1 2 1 2 2 2 0 1 1 1 2 2 2 0 1 1 2 2 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

NewcastleAR_str = Y;
NewcastleAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if NewcastleAR_str < 0.5
    NewcastleR = ('Arsenal will lose');

elseif (0.5 <= NewcastleAR_str) && (NewcastleAR_str < 1.5)
    NewcastleR = ('Arsenal will draw');
   
elseif NewcastleAR_str >= 1.5
    NewcastleR = ('Arsenal will win');
  
end;
%if statement to predict result of 2nd meeting
if NewcastleAR_str2 < 0.5
    NewcastleR2 = ('Arsenal will lose');
   
elseif (0.5 <= NewcastleAR_str2) && (NewcastleAR_str2 < 1.5)
    NewcastleR2 = ('Arsenal will draw');
    
elseif NewcastleAR_str2 >= 1.5
    NewcastleR2 = ('Arsenal will win');
   
end;

data = [2 2 2 1 0 2]'; %data for predicting 1st meeting of season
data2 = [2 2 2 1 0 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

NorwichAR_str = Y;
NorwichAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if NorwichAR_str < 0.5
    NorwichR = ('Arsenal will lose');
  
elseif (0.5 <= NorwichAR_str) && (NorwichAR_str < 1.5)
    NorwichR = ('Arsenal will draw');
    
elseif NorwichAR_str >= 1.5
    NorwichR = ('Arsenal will win');

end;
%if statement to predict result of 2nd meeting
if NorwichAR_str2 < 0.5
    NorwichR2 = ('Arsenal will lose');
    
elseif (0.5 <= NorwichAR_str2) && (NorwichAR_str2 < 1.5)
    NorwichR2 = ('Arsenal will draw');

elseif NorwichAR_str2 >= 1.5
    NorwichR2 = ('Arsenal will win');
 
end;

data = [2 2 2 2 1 1 2 2 2 0 2 1 0 2 2 2 1 1 2 1]'; %data for predicting 1st meeting of season
data2 = [2 2 2 2 1 1 2 2 2 0 2 1 0 2 2 2 1 1 2 1 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

SouthamptonAR_str = Y;
SouthamptonAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if SouthamptonAR_str < 0.5
    SouthamptonR = ('Arsenal will lose');
   
elseif (0.5 <= SouthamptonAR_str) && (SouthamptonAR_str < 1.5)
    SouthamptonR = ('Arsenal will draw');
   
elseif SouthamptonAR_str >= 1.5
    SouthamptonR = ('Arsenal will win');
  
end;
%if statement to predict result of 2nd meeting
if SouthamptonAR_str2 < 0.5
    SouthamptonR2 = ('Arsenal will lose');
 
elseif (0.5 <= SouthamptonAR_str2) && (SouthamptonAR_str2 < 1.5)
    SouthamptonR2 = ('Arsenal will draw');
 
elseif SouthamptonAR_str2 >= 1.5
    SouthamptonR2 = ('Arsenal will win');
   
end;

data = [0 2 2 2 2 0 2 1 1 2]'; %data for predicting 1st meeting of season
data2 = [0 2 2 2 2 0 2 1 1 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

StokeAR_str = Y;
StokeAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if StokeAR_str < 0.5
    StokeR = ('Arsenal will lose');
  
elseif (0.5 <= StokeAR_str) && (StokeAR_str < 1.5)
    StokeR = ('Arsenal will draw');
    
elseif StokeAR_str >= 1.5
    StokeR = ('Arsenal will win');
    
end;
%if statement to predict result of 2nd meeting
if StokeAR_str2 < 0.5
    StokeR2 = ('Arsenal will lose');
  
elseif (0.5 <= StokeAR_str2) && (StokeAR_str2 < 1.5)
    StokeR2 = ('Arsenal will draw');
    
elseif StokeAR_str2 >= 1.5
    StokeR2 = ('Arsenal will win');
  
end;

data = [0 1 2 0 1 1 2 2 2 2 2 2 2 1 1 0 2 1 1 2 2 1 2]'; %data for predicting 1st meeting of season
data2 = [0 1 2 0 1 1 2 2 2 2 2 2 2 1 1 0 2 1 1 2 2 1 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

SunderlandAR_str = Y;
SunderlandAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if SunderlandAR_str < 0.5
    SunderlandR = ('Arsenal will lose');
    
elseif (0.5 <= SunderlandAR_str) && (SunderlandAR_str < 1.5)
    SunderlandR = ('Arsenal will draw');
    
elseif SunderlandAR_str >= 1.5
    SunderlandR = ('Arsenal will win');
  
end;
%if statement to predict result of 2nd meeting
if SunderlandAR_str2 < 0.5
    SunderlandR2 = ('Arsenal will lose');
    
elseif (0.5 <= SunderlandAR_str2) && (SunderlandAR_str2 < 1.5)
    SunderlandR2 = ('Arsenal will draw');

elseif SunderlandAR_str2 >= 1.5
    SunderlandR2 = ('Arsenal will win');
 
end;

data = [2 1 1 1 1 2 0 2 1 2 1 2 2 1 2 1 2 2 1 1 2 1 2 2 1 1 2 0 0 1 0 2 2 0]'; %data for predicting 1st meeting of season
data2 = [2 1 1 1 1 2 0 2 1 2 1 2 2 1 2 1 2 2 1 1 2 1 2 2 1 1 2 0 0 1 0 2 2 0 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

TottenhamAR_str = Y;
TottenhamAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if TottenhamAR_str < 0.5
    TottenhamR = ('Arsenal will lose');
   
elseif (0.5 <= TottenhamAR_str) && (TottenhamAR_str < 1.5)
    TottenhamR = ('Arsenal will draw');
   
elseif TottenhamAR_str >= 1.5
    TottenhamR = ('Arsenal will win');
 
end;
%if statement to predict result of 2nd meeting
if TottenhamAR_str2 < 0.5
    TottenhamR2 = ('Arsenal will lose');
  
elseif (0.5 <= TottenhamAR_str2) && (TottenhamAR_str2 < 1.5)
    TottenhamR2 = ('Arsenal will draw');
  
elseif TottenhamAR_str2 >= 1.5
    TottenhamR2 = ('Arsenal will win');

end;

data = [2 2 1 2 0 2 2 2 0 1 2 2 2 2]'; %data for predicting 1st meeting of season
data2 = [2 2 1 2 0 2 2 2 0 1 2 2 2 2 1]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

WestBromAR_str = Y;
WestBromAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if WestBromAR_str < 0.5
    WestBromR = ('Arsenal will lose');
  
elseif (0.5 <= WestBromAR_str) && (WestBromAR_str < 1.5)
    WestBromR = ('Arsenal will draw');
 
elseif WestBromAR_str >= 1.5
    WestBromR = ('Arsenal will win');
 
end;
%if statement to predict result of 2nd meeting
if WestBromAR_str2 < 0.5
    WestBromR2 = ('Arsenal will lose');
   
elseif (0.5 <= WestBromAR_str2) && (WestBromAR_str2 < 1.5)
    WestBromR2 = ('Arsenal will draw');

elseif WestBromAR_str2 >= 1.5
    WestBromR2 = ('Arsenal will win');

end;

data = [2 2 1 2 2 0 2 2 2 1 2 1 2 1 0 0 0 2 2 2 1 1 2 2 2 2 2]'; %data for predicting 1st meeting of season
data2 = [2 2 1 2 2 0 2 2 2 1 2 1 2 1 0 0 0 2 2 2 1 1 2 2 2 2 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

WestHamAR_str = Y;
WestHamAR_str2 = YF;

%if statement to display predicted result of 1st meeting
if WestHamAR_str < 0.5
    WestHamR = ('Arsenal will lose');
   
elseif (0.5 <= WestHamAR_str) && (WestHamAR_str < 1.5)
    WestHamR = ('Arsenal will draw');

elseif WestHamAR_str >= 1.5
    WestHamR = ('Arsenal will win');
  
end;
%if statement to predict result of 2nd meeting
if WestHamAR_str2 < 0.5
    WestHamR2 = ('Arsenal will lose');

elseif (0.5 <= WestHamAR_str2) && (WestHamAR_str2 < 1.5)
    WestHamR2 = ('Arsenal will draw');

elseif WestHamAR_str2 >= 1.5
    WestHamR2 = ('Arsenal will win');

end;


AR_string = {'1', AstonVillaR, AstonVillaAR_str;'2', FulhamR, FulhamAR_str;'3', TottenhamR, TottenhamAR_str;'4', SunderlandR, SunderlandAR_str;'5', StokeR, StokeAR_str;'6', 'Arsenal vs Swansea could not be predicted', '';'7' WestBromR, WestBromAR_str;'8', NorwichR, NorwichAR_str;'9', 'Arsenal vs Cyrstal Palace could not be predicted', '';'10', LiverpoolR, LiverpoolAR_str;'11', ManUtdR,  ManUtdAR_str;'12', SouthamptonR, SouthamptonAR_str;'13', 'Arsenal vs Cardiff City could not be predicted', '';'14', 'Arsenal vs Hull City could not be predicted', '';'15' EvertonR, EvertonAR_str;'16', ManCityR, ManCityAR_str;'17', ChelseaR, ChelseaAR_str;'18', WestHamR, WestHamAR_str;'19', NewcastleR, NewcastleAR_str;'20', 'Arsenal vs Cardiff City could not be predicted', '';'21', AstonVillaR2, AstonVillaAR_str2;'22', FulhamR2, FulhamAR_str2;'23', SouthamptonR2, SouthamptonAR_str2;'24', 'Arsenal vs Crystal Palace could not be predicted', '';'25', LiverpoolR2, LiverpoolAR_str2;'26', ManUtdR2, ManUtdAR_str2;'27', SunderlandR2, SunderlandAR_str2;'28', StokeR2, StokeAR_str2;'29', TottenhamR2, TottenhamAR_str2;'30', ChelseaR2, ChelseaAR_str2;'31', 'Arsenal vs Swansea could not be predicted', '';'32', ManCityR2, ManCityAR_str2;'33', EvertonR2, EvertonAR_str2;'34', WestHamR2, WestHamAR_str2;'35', 'Arsenal vs Hull City could not be predicted', '';'36', NewcastleR2, NewcastleAR_str2;'37', WestBromR2, WestBromAR_str2;'38', NorwichR2, NorwichAR_str2};
disp(AR_string);
end

