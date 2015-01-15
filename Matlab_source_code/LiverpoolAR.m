data = [0 0 0 1 1 0 0 2 0 2 1 1 1 2 2 0 2 0 2 2 0 1 1 1 1 2 2 1 1 0 2 2 1]'; %data for predicting 1st meeting of season
data2 = [0 0 0 1 1 0 0 2 0 2 1 1 1 2 2 0 2 0 2 2 0 1 1 1 1 2 2 1 1 0 2 2 1 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

LiverpoolAR_str = Y;
LiverpoolAR_str2 = YF;
disp(LiverpoolAR_str)
disp(LiverpoolAR_str2);
%if statement to display predicted result of 1st meeting
if LiverpoolAR_str < 0.5
    LiverpoolR = ('Arsenal will lose');
    disp(LiverpoolR)
elseif (0.5 <= LiverpoolAR_str) && (LiverpoolAR_str < 1.5)
    LiverpoolR = ('Arsenal will draw');
    disp(LiverpoolR)
elseif LiverpoolAR_str >= 1.5
    LiverpoolR = ('Arsenal will win');
    disp(LiverpoolR)
end;
%if statement to predict result of 2nd meeting
if LiverpoolAR_str2 < 0.5
    LiverpoolR2 = ('Arsenal will lose');
    disp(LiverpoolR2)
elseif (0.5 <= LiverpoolAR_str2) && (LiverpoolAR_str2 < 1.5)
    LiverpoolR2 = ('Arsenal will draw');
    disp(LiverpoolR2)
elseif LiverpoolAR_str2 >= 1.5
    LiverpoolR2 = ('Arsenal will win');
    disp(LiverpoolR2)
end;