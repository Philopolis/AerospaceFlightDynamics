%攻角法向过载系数
function n_y2alpha = NormalOverload_y2alpha(v,x,y,alpha,t)
run('Constants.m');

n_y2alpha = (Propulsion(x) .* cos(alpha) + (C_yalpha - m_zalpha/m_zdelta_z .* C_ydelta_z) .* DynamicPressure(y,v) .* S)/Gravity(t,x,y);
end

