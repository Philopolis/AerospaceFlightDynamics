%% 攻角法向过载系数
function n_y2alpha = NormalOverload_y2alpha(v,x,y,alpha,t)

C_yalpha = 18/pi;%攻角升力系数
C_ydelta_z = 18/(5 * pi);%舵偏角升力系数
m_zalpha = -27/(25 * pi);%攻角力矩系数
m_zdelta_z = 189/(125 * pi);%舵偏角力矩系数
S = 0.45;%参考面积

n_y2alpha = (Propulsion(x) .* cos(alpha) + (C_yalpha - m_zalpha/m_zdelta_z .* C_ydelta_z) .* DynamicPressure(y,v) .* S)/Gravity(t,x,y);
end

