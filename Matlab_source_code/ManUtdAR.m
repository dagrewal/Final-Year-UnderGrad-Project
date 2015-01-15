data = [0 0 2 2 2 1 0 1 2 0 2 2 0 1 1 1 0 0 1 0 2 1 0 0 0 2 0 0 0 1]'; %data for predicting 1st meeting of season
data2 = [0 0 2 2 2 1 0 1 2 0 2 2 0 1 1 1 0 0 1 0 2 1 0 0 0 2 0 0 0 1 0]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

ManUtdAR_str = Y;
ManUtdAR_str2 = YF;
disp(ManUtdAR_str)
disp(ManUtdAR_str2);
%if statement to display predicted result of 1st meeting
if ManUtdAR_str < 0.5
    ManUtdR = ('Arsenal will lose');
    disp(ManUtdR)
elseif (0.5 <= ManUtdAR_str) && (ManUtdAR_str < 1.5)
    ManUtdR = ('Arsenal will draw');
    disp(ManUtdR)
elseif ManUtdAR_str >= 1.5
    ManUtdR = ('Arsenal will win');
    disp(ManUtdR)
end;
%if statement to predict result of 2nd meeting
if ManUtdAR_str2 < 0.5
    ManUtdR2 = ('Arsenal will lose');
    disp(ManUtdR2)
elseif (0.5 <= ManUtdAR_str2) && (ManUtdAR_str2 < 1.5)
    ManUtdR2 = ('Arsenal will draw');
    disp(ManUtdR2)
elseif ManUtdAR_str2 >= 1.5
    ManUtdR2 = ('Arsenal will win');
    disp(ManUtdR2)
end;