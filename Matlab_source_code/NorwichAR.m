data = [2 2 2 1 0 2]'; %data for predicting 1st meeting of season
data2 = [2 2 2 1 0 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

NorwichAR_str = Y;
NorwichAR_str2 = YF;
disp(NorwichAR_str)
disp(NorwichAR_str2);
%if statement to display predicted result of 1st meeting
if NorwichAR_str < 0.5
    NorwichR = ('Arsenal will lose');
    disp(NorwichR)
elseif (0.5 <= NorwichAR_str) && (NorwichAR_str < 1.5)
    NorwichR = ('Arsenal will draw');
    disp(NorwichR)
elseif NorwichAR_str >= 1.5
    NorwichR = ('Arsenal will win');
    disp(NorwichR)
end;
%if statement to predict result of 2nd meeting
if NorwichAR_str2 < 0.5
    NorwichR2 = ('Arsenal will lose');
    disp(NorwichR2)
elseif (0.5 <= NorwichAR_str2) && (NorwichAR_str2 < 1.5)
    NorwichR2 = ('Arsenal will draw');
    disp(NorwichR2)
elseif NorwichAR_str2 >= 1.5
    NorwichR2 = ('Arsenal will win');
    disp(NorwichR2)
end;