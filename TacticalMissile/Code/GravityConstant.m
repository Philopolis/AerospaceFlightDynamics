%% 重力加速度
function g = GravityConstant(y)

g_0 = 9.81;%标准海平面重力加速度
R_e = 6371000;%地球平均半径

if y > 0
    g = g_0 .* (R_e/(R_e + y)).^2;
else
    g = g_0;
end
end

