data = [2 2 1 2 2 0 2 2 2 1 2 1 2 1 0 0 0 2 2 2 1 1 2 2 2 2 2]'; %data for predicting 1st meeting of season
data2 = [2 2 1 2 2 0 2 2 2 1 2 1 2 1 0 0 0 2 2 2 1 1 2 2 2 2 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

WestHamAR_str = Y;
WestHamAR_str2 = YF;
disp(WestHamAR_str)
disp(WestHamAR_str2);
%if statement to display predicted result of 1st meeting
if WestHamAR_str < 0.5
    WestHamR = ('Arsenal will lose');
    disp(WestHamR)
elseif (0.5 <= WestHamAR_str) && (WestHamAR_str < 1.5)
    WestHamR = ('Arsenal will draw');
    disp(WestHamR)
elseif WestHamAR_str >= 1.5
    WestHamR = ('Arsenal will win');
    disp(WestHamR)
end;
%if statement to predict result of 2nd meeting
if WestHamAR_str2 < 0.5
    WestHamR2 = ('Arsenal will lose');
    disp(WestHamR2)
elseif (0.5 <= WestHamAR_str2) && (WestHamAR_str2 < 1.5)
    WestHamR2 = ('Arsenal will draw');
    disp(WestHamR2)
elseif WestHamAR_str2 >= 1.5
    WestHamR2 = ('Arsenal will win');
    disp(WestHamR2)
end;
