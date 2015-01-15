data = [2 0 2 2 2 1 1 0 2 1 0 2 2 1 2 1 2 2 2 0 1 1 1 2 2 2 0 1 1 2 2 2]'; %data for predicting 1st meeting of season
data2 = [2 0 2 2 2 1 1 0 2 1 0 2 2 1 2 1 2 2 2 0 1 1 1 2 2 2 0 1 1 2 2 2 2]'; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

NewcastleAR_str = Y;
NewcastleAR_str2 = YF;
disp(NewcastleAR_str)
disp(NewcastleAR_str2);
%if statement to display predicted result of 1st meeting
if NewcastleAR_str < 0.5
    NewcastleR = ('Arsenal will lose');
    disp(NewcastleR)
elseif (0.5 <= NewcastleAR_str) && (NewcastleAR_str < 1.5)
    NewcastleR = ('Arsenal will draw');
    disp(NewcastleR)
elseif NewcastleAR_str >= 1.5
    NewcastleR = ('Arsenal will win');
    disp(NewcastleR)
end;
%if statement to predict result of 2nd meeting
if NewcastleAR_str2 < 0.5
    NewcastleR2 = ('Arsenal will lose');
    disp(NewcastleR2)
elseif (0.5 <= NewcastleAR_str2) && (NewcastleAR_str2 < 1.5)
    NewcastleR2 = ('Arsenal will draw');
    disp(NewcastleR2)
elseif NewcastleAR_str2 >= 1.5
    NewcastleR2 = ('Arsenal will win');
    disp(NewcastleR2)
end;