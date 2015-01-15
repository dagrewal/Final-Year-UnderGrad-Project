data = [1;1;0;0;2;2;1;2;1;2;2;2;1;2;2;2;2;1;2;1;2;2;1;0;1;2;1;2;0;2;2;1;2;]; %data for predicting 1st meeting of season
data2 = [1;1;0;0;2;2;1;2;1;2;2;2;1;2;2;2;2;1;2;1;2;2;1;0;1;2;1;2;0;2;2;1;2;0;]; %data for predicting second meet of season after actual result of first meeting is known
model = arima('AR',[0.5,0.25,0.15,0.09]); %autoregression model with known coefficients
estmdl = estimate(model,data); %fit ar model to the data specified
estmdl2 = estimate(model,data2); % fit ar model to the data specified
[Y YMSE] = forecast(estmdl,1,'Y0',data); %forecast 1st prediction
[YF YMSE] = forecast(estmdl2,1,'Y0',data2); %forecast 2nd prediction

AstonVillaAR_str = Y;
AstonVillaAR_str2 = YF;
disp(AstonVillaAR_str)
disp(AstonVillaAR_str2);
%if statement to display predicted result of 1st meeting
if AstonVillaAR_str < 0.5
    AstonVillaR = ('Arsenal will lose');
    disp(AstonVillaR)
elseif (0.5 <= AstonVillaAR_str) && (AstonVillaAR_str < 1.5)
    AstonVillaR = ('Arsenal will draw');
    disp(AstonVillaR)
elseif AstonVillaAR_str >= 1.5
    AstonVillaR = ('Arsenal will win');
    disp(AstonVillaR)
end;
%if statement to predict result of 2nd meeting
if AstonVillaAR_str2 < 0.5
    AstonVillaR2 = ('Arsenal will lose');
    disp(AstonVillaR2)
elseif (0.5 <= AstonVillaAR_str2) && (AstonVillaAR_str2 < 1.5)
    AstonVillaR2 = ('Arsenal will draw');
    disp(AstonVillaR2)
elseif AstonVillaAR_str2 >= 1.5
    AstonVillaR2 = ('Arsenal will win');
    disp(AstonVillaR2)
end;