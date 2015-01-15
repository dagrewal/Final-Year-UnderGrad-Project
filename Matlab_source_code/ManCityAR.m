data = [2 2 2 2 2 2 2 1 2 2 0 2 2 2 0 2 0 1 2 1 0 2 1 0]'; %data for predicting 1st meeting of season
data2 = [2 2 2 2 2 2 2 1 2 2 0 2 2 2 0 2 0 1 2 1 0 2 1 0 0]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

ManCityAR_str = Y;
ManCityAR_str2 = YF;
disp(ManCityAR_str)
disp(ManCityAR_str2);
%if statement to display predicted result of 1st meeting
if ManCityAR_str < 0.5
    ManCityR = ('Arsenal will lose');
    disp(ManCityR)
elseif (0.5 <= ManCityAR_str) && (ManCityAR_str < 1.5)
    ManCityR = ('Arsenal will draw');
    disp(ManCityR)
elseif ManCityAR_str >= 1.5
    ManCityR = ('Arsenal will win');
    disp(ManCityR)
end;
%if statement to predict result of 2nd meeting
if ManCityAR_str2 < 0.5
    ManCityR2 = ('Arsenal will lose');
    disp(ManCityR2)
elseif (0.5 <= ManCityAR_str2) && (ManCityAR_str2 < 1.5)
    ManCityR2 = ('Arsenal will draw');
    disp(ManCityR2)
elseif ManCityAR_str2 >= 1.5
    ManCityR2 = ('Arsenal will win');
    disp(ManCityR2)
end;