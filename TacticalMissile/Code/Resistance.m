%% 阻力函数
function X = Resistance(alpha,y,v)

S = 0.45;%参考面积
C_x = 0.2 + 0.03 .* alpha^2;%×èÁ¦ÏµÊý

q = DynamicPressure(y,v);

X = C_x .* q .* S
end

