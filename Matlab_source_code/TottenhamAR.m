data = [2 1 1 1 1 2 0 2 1 2 1 2 2 1 2 1 2 2 1 1 2 1 2 2 1 1 2 0 0 1 0 2 2 0]'; %data for predicting 1st meeting of season
data2 = [2 1 1 1 1 2 0 2 1 2 1 2 2 1 2 1 2 2 1 1 2 1 2 2 1 1 2 0 0 1 0 2 2 0 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

TottenhamAR_str = Y;
TottenhamAR_str2 = YF;
disp(TottenhamAR_str)
disp(TottenhamAR_str2);
%if statement to display predicted result of 1st meeting
if TottenhamAR_str < 0.5
    TottenhamR = ('Arsenal will lose');
    disp(TottenhamR)
elseif (0.5 <= TottenhamAR_str) && (TottenhamAR_str < 1.5)
    TottenhamR = ('Arsenal will draw');
    disp(TottenhamR)
elseif TottenhamAR_str >= 1.5
    TottenhamR = ('Arsenal will win');
    disp(TottenhamR)
end;
%if statement to predict result of 2nd meeting
if TottenhamAR_str2 < 0.5
    TottenhamR2 = ('Arsenal will lose');
    disp(TottenhamR2)
elseif (0.5 <= TottenhamAR_str2) && (TottenhamAR_str2 < 1.5)
    TottenhamR2 = ('Arsenal will draw');
    disp(TottenhamR2)
elseif TottenhamAR_str2 >= 1.5
    TottenhamR2 = ('Arsenal will win');
    disp(TottenhamR2)
end;