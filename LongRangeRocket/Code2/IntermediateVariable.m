%% 相关量计算
function [varvec,others] = IntermediateVariable(state,t,Constant)
%% 状态量提取
theta = state(4);
%% 质量计算
% 常数提取
m_0 = Constant(3);
m_s = Constant(4);
m = m_0 - m_s * t;
%% 攻角计算
% 常数提取
A_phi = Constant(5);
phi_pr = phi_program(t);
alpha = A_phi * (phi_pr - theta);
%% 切向力计算
% 常数提取
P_e = Constant(1);
g = Constant(2);
P_ex = P_e + m * g * sin(theta);
%% 过载计算
% 箭体过载
n_x1 = P_e/(m * -g);
n_y1 = 0;

% 弹道过载
n_x2 = P_e/(m * -g);
n_y2 = P_e * alpha/(m * -g);
%% 相关量汇总
varvec = [m;alpha];
others = [P_e;P_ex;n_x1;n_y1;n_x2;n_y2;phi_pr];
end

