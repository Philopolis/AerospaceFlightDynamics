%% 大气密度函数
function rho = AtmosDensity(y)

rho_0 = 1.2495;%标准海平面大气密度
T_0 = 288.15;%标准海平面大气温度

if y > 0
    rho = rho_0 .* ((T_0 - 0.0065 .* y)/T_0).^4.25588;
else
    disp('height error in AtmosDensity');
end
end

