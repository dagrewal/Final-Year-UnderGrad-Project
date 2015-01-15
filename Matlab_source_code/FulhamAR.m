data = [2 2 2 2 1 2 2 2 2 2 0 2 2 2 0 1 2 2 2 1 1 0 1 2]'; %data for predicting 1st meeting of season
data2 = [2 2 2 2 1 2 2 2 2 2 0 2 2 2 0 1 2 2 2 1 1 0 1 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

FulhamAR_str = Y;
FulhamAR_str2 = YF;
disp(FulhamAR_str)
disp(FulhamAR_str2);
%if statement to display predicted result of 1st meeting
if FulhamAR_str < 0.5
    FulhamR = ('Arsenal will lose');
    disp(FulhamR)
elseif (0.5 <= FulhamAR_str) && (FulhamAR_str < 1.5)
    FulhamR = ('Arsenal will draw');
    disp(FulhamR)
elseif FulhamAR_str >= 1.5
    FulhamR = ('Arsenal will win');
    disp(FulhamR)
end;
%if statement to predict result of 2nd meeting
if FulhamAR_str2 < 0.5
    FulhamR2 = ('Arsenal will lose');
    disp(FulhamR2)
elseif (0.5 <= FulhamAR_str2) && (FulhamAR_str2 < 1.5)
    FulhamR2 = ('Arsenal will draw');
    disp(FulhamR2)
elseif FulhamAR_str2 >= 1.5
    FulhamR2 = ('Arsenal will win');
    disp(FulhamR2)
end;