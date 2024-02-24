%% 重力加速度
function g = GravityConstant(y)

% 常数提取
global g0 R_e;

if y > 0
    g = g0 * (R_e/(R_e + y))^2;
else
    g = g0;
end
end

