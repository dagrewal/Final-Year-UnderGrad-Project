data = [2 2 2 2 1 1 2 2 2 0 2 1 0 2 2 2 1 1 2 1]'; %data for predicting 1st meeting of season
data2 = [2 2 2 2 1 1 2 2 2 0 2 1 0 2 2 2 1 1 2 1 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

SouthamptonAR_str = Y;
SouthamptonAR_str2 = YF;
disp(SouthamptonAR_str)
disp(SouthamptonAR_str2);
%if statement to display predicted result of 1st meeting
if SouthamptonAR_str < 0.5
    SouthamptonR = ('Arsenal will lose');
    disp(SouthamptonR)
elseif (0.5 <= SouthamptonAR_str) && (SouthamptonAR_str < 1.5)
    SouthamptonR = ('Arsenal will draw');
    disp(SouthamptonR)
elseif SouthamptonAR_str >= 1.5
    SouthamptonR = ('Arsenal will win');
    disp(SouthamptonR)
end;
%if statement to predict result of 2nd meeting
if SouthamptonAR_str2 < 0.5
    SouthamptonR2 = ('Arsenal will lose');
    disp(SouthamptonR2)
elseif (0.5 <= SouthamptonAR_str2) && (SouthamptonAR_str2 < 1.5)
    SouthamptonR2 = ('Arsenal will draw');
    disp(SouthamptonR2)
elseif SouthamptonAR_str2 >= 1.5
    SouthamptonR2 = ('Arsenal will win');
    disp(SouthamptonR2)
end;