data = [0 1 2 0 1 1 2 2 2 2 2 2 2 1 1 0 2 1 1 2 2 1 2]'; %data for predicting 1st meeting of season
data2 = [0 1 2 0 1 1 2 2 2 2 2 2 2 1 1 0 2 1 1 2 2 1 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

SunderlandAR_str = Y;
SunderlandAR_str2 = YF;
disp(SunderlandAR_str)
disp(SunderlandAR_str2);
%if statement to display predicted result of 1st meeting
if SunderlandAR_str < 0.5
    SunderlandR = ('Arsenal will lose');
    disp(SunderlandR)
elseif (0.5 <= SunderlandAR_str) && (SunderlandAR_str < 1.5)
    SunderlandR = ('Arsenal will draw');
    disp(SunderlandR)
elseif SunderlandAR_str >= 1.5
    SunderlandR = ('Arsenal will win');
    disp(SunderlandR)
end;
%if statement to predict result of 2nd meeting
if SunderlandAR_str2 < 0.5
    SunderlandR2 = ('Arsenal will lose');
    disp(SunderlandR2)
elseif (0.5 <= SunderlandAR_str2) && (SunderlandAR_str2 < 1.5)
    SunderlandR2 = ('Arsenal will draw');
    disp(SunderlandR2)
elseif SunderlandAR_str2 >= 1.5
    SunderlandR2 = ('Arsenal will win');
    disp(SunderlandR2)
end;