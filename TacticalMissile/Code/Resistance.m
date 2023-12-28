%气动阻力函数
function X = Resistance(alpha,y,v)
run('Constants.m');

C_x = 0.2 + 0.03 .* alpha^2;%阻力系数

q = DynamicPressure(y,v);

X = C_x .* q .* S
end

