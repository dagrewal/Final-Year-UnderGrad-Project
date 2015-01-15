data = [0 2 2 2 2 0 2 1 1 2]'; %data for predicting 1st meeting of season
data2 = [0 2 2 2 2 0 2 1 1 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

StokeAR_str = Y;
StokeAR_str2 = YF;
disp(StokeAR_str)
disp(StokeAR_str2);
%if statement to display predicted result of 1st meeting
if StokeAR_str < 0.5
    StokeR = ('Arsenal will lose');
    disp(StokeR)
elseif (0.5 <= StokeAR_str) && (StokeAR_str < 1.5)
    StokeR = ('Arsenal will draw');
    disp(StokeR)
elseif StokeAR_str >= 1.5
    StokeR = ('Arsenal will win');
    disp(StokeR)
end;
%if statement to predict result of 2nd meeting
if StokeAR_str2 < 0.5
    StokeR2 = ('Arsenal will lose');
    disp(StokeR2)
elseif (0.5 <= StokeAR_str2) && (StokeAR_str2 < 1.5)
    StokeR2 = ('Arsenal will draw');
    disp(StokeR2)
elseif StokeAR_str2 >= 1.5
    StokeR2 = ('Arsenal will win');
    disp(StokeR2)
end;