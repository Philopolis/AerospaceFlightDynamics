%% 大气密度函数
function rho = AtmosDensity(y)
run('Constants.m');

if y > 0
    rho = rho_0 .* ((T_0 - 0.0065 .* y)/T_0).^4.25588;
else
    disp('height error in AtmosDensity');
end
end

