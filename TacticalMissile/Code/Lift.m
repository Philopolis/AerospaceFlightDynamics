%% 升力函数
function Y = Lift(alpha,delta_z,y,v)

C_yalpha = 18/pi;%攻角升力系数
C_ydelta_z = 18/(5 * pi);%舵偏角升力系数
m_zalpha = -27/(25 * pi);%攻角力矩系数
m_zdelta_z = 189/(125 * pi);%舵偏角力矩系数
S = 0.45;%参考面积

q = DynamicPressure(y,v);

Y = (C_yalpha .* alpha + C_ydelta_z .* delta_z) .* q .* S;
end

