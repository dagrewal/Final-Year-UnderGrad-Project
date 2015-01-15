data = [2 2 1 2 0 2 2 2 0 1 2 2 2 2]'; %data for predicting 1st meeting of season
data2 = [2 2 1 2 0 2 2 2 0 1 2 2 2 2 1]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

WestBromAR_str = Y;
WestBromAR_str2 = YF;
disp(WestBromAR_str)
disp(WestBromAR_str2);
%if statement to display predicted result of 1st meeting
if WestBromAR_str < 0.5
    WestBromR = ('Arsenal will lose');
    disp(WestBromR)
elseif (0.5 <= WestBromAR_str) && (WestBromAR_str < 1.5)
    WestBromR = ('Arsenal will draw');
    disp(WestBromR)
elseif WestBromAR_str >= 1.5
    WestBromR = ('Arsenal will win');
    disp(WestBromR)
end;
%if statement to predict result of 2nd meeting
if WestBromAR_str2 < 0.5
    WestBromR2 = ('Arsenal will lose');
    disp(WestBromR2)
elseif (0.5 <= WestBromAR_str2) && (WestBromAR_str2 < 1.5)
    WestBromR2 = ('Arsenal will draw');
    disp(WestBromR2)
elseif WestBromAR_str2 >= 1.5
    WestBromR2 = ('Arsenal will win');
    disp(WestBromR2)
end;