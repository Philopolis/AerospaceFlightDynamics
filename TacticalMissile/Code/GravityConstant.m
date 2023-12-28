%重力加速度函数
function g = GravityConstant(y)
run('Constants.m');

if y > 0
    g = g_0 .* (R_e/(R_e + y)).^2;
else
    g = g_0;
end
end

