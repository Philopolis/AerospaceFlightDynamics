%% 攻角法向过载系数
function n_y2alpha = NormalOverload_y2alpha(v,x,y,t)

% 常数提取
global C_yalpha m_zalpha m_zdelta_z C_ydelta_z S;

n_y2alpha = (Propulsion(x)  + (C_yalpha - m_zalpha/m_zdelta_z * C_ydelta_z) * 1/2 * AtmosDensity(y) * v^2 * S)/(Mass(x,t) * GravityConstant(y));
end

