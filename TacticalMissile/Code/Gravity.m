%% 重力函数
function G = Gravity(t,x,y)

G = mass(t,x) .* GravityConstant(y);
end

