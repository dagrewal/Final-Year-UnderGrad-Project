data = [2 2 1 2 2 2 2 2 0 2 2 2 0 2 2 1 2 2 2 0 1 0 2 2 2 1 2 1 2 2 2 2 1 1]'; %data for predicting 1st meeting of season
data2 = [2 2 1 2 2 2 2 2 0 2 2 2 0 2 2 1 2 2 2 0 1 0 2 2 2 1 2 1 2 2 2 2 1 1 1]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

EvertonAR_str = Y;
EvertonAR_str2 = YF;
disp(EvertonAR_str)
disp(EvertonAR_str2);
%if statement to display predicted result of 1st meeting
if EvertonAR_str < 0.5
    EvertonR = ('Arsenal will lose');
    disp(EvertonR)
elseif (0.5 <= EvertonAR_str) && (EvertonAR_str < 1.5)
    EvertonR = ('Arsenal will draw');
    disp(EvertonR)
elseif EvertonAR_str >= 1.5
    EvertonR = ('Arsenal will win');
    disp(EvertonR)
end;
%if statement to predict result of 2nd meeting
if EvertonAR_str2 < 0.5
    EvertonR2 = ('Arsenal will lose');
    disp(EvertonR2)
elseif (0.5 <= EvertonAR_str2) && (EvertonAR_str2 < 1.5)
    EvertonR2 = ('Arsenal will draw');
    disp(EvertonR2)
elseif EvertonAR_str2 >= 1.5
    EvertonR2 = ('Arsenal will win');
    disp(EvertonR2)
end;