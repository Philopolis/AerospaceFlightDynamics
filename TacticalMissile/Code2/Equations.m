%% 动力学模型解算
function dot_state = Equations(state,t)
%% 状态向量提取
V = state(1);
theta = state(4);
%% 相关变量计算
[inate,~] = IntermediateVariable(state,t);

% 相关变量提取
P = inate(1);
X_b = inate(2);
Y_b = inate(3);
m = inate(4);
g = inate(5);
alpha_b = inate(6);
%% 动力学方程计算
dot_state = state * 0;
dot_state(1) = (P * cos(alpha_b) - X_b)/m - g * sin(theta);
dot_state(2) = V * cos(theta);
dot_state(3) = V * sin(theta);
dot_state(4) = (P * sin(alpha_b) + Y_b)/(m * V) - g/V * cos(theta);
end

