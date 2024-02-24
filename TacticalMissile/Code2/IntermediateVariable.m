%% 相关量计算
function [varvec,others] = IntermediateVariable(state,t)
%% 状态量提取
V = state(1);
x = state(2);
y = state(3);
theta = state(4);
%% 推力计算
P = Propulsion(x);
%% 攻角计算
alpha_b = NormalOverload_y2(V,x,y,theta)/NormalOverload_y2alpha(V,x,y,t);
%% 俯仰角计算
vartheta = alpha_b + theta;
%% 瞬时平衡假设
% 常数提取
global m_zalpha m_zdelta_z;
delta_zb = -m_zalpha/m_zdelta_z * alpha_b;
%% 气动力计算
% 常数提取
global S C_yalpha C_ydelta_z;
X_b = (0.2 + 0.03 * alpha_b^2) * 1/2 * AtmosDensity(y) * V^2 * S;
Y_b = (C_yalpha * alpha_b + C_ydelta_z * delta_zb) * 1/2 * AtmosDensity(y) * V^2 * S;
%% 质量计算
m = Mass(x,t);
%% 重力加速度计算
g = GravityConstant(y);
%% 相关量汇总
varvec = [P;X_b;Y_b;m;g;alpha_b];
others = [delta_zb;vartheta];
end

