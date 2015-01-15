data = [2;2;2;1;2;2;2;1;1;1;2;1;2;2;2;1;1;0;0;1;1;2;0;2;0;0;0;0;2;2;1;0;0;]; %data for predicting 1st meeting of season
data2 = [2;2;2;1;2;2;2;1;1;1;2;1;2;2;2;1;1;0;0;1;1;2;0;2;0;0;0;0;2;2;1;0;0;1;]; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

ChelseaAR_str = Y;
ChelseaAR_str2 = YF;
disp(ChelseaAR_str)
disp(ChelseaAR_str2);
%if statement to display predicted result of 1st meeting
if ChelseaAR_str < 0.5
    ChelseaR = ('Arsenal will lose');
    disp(ChelseaR)
elseif (0.5 <= ChelseaAR_str) && (ChelseaAR_str < 1.5)
    ChelseaR = ('Arsenal will draw');
    disp(ChelseaR)
elseif ChelseaAR_str >= 1.5
    ChelseaR = ('Arsenal will win');
    disp(ChelseaR)
end;
%if statement to predict result of 2nd meeting
if ChelseaAR_str2 < 0.5
    ChelseaR2 = ('Arsenal will lose');
    disp(ChelseaR2)
elseif (0.5 <= ChelseaAR_str2) && (ChelseaAR_str2 < 1.5)
    ChelseaR2 = ('Arsenal will draw');
    disp(ChelseaR2)
elseif ChelseaAR_str2 >= 1.5
    ChelseaR2 = ('Arsenal will win');
    disp(ChelseaR2)
end;