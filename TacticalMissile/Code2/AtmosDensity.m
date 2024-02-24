%% 大气密度函数
function rho = AtmosDensity(y)

% 常数提取
global rho0 T0;

if y >= 0
    rho = rho0 * ((T0 - 0.0065 * y)/T0)^4.25588;
else
    rho = rho0;
end
end

