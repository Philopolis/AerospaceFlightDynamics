%% 动力学模型解算
function dot_state = Equations(state,t,Constant)
%% 状态向量提取
v = state(1);
theta = state(4);
%% 常数提取
P_e = Constant(1);
g = Constant(2);
%% 相关变量计算
[inate,~] = IntermediateVariable(state,t,Constant);

% 相关变量提取
m = inate(1);
alpha = inate(2);
%% 动力学方程计算
dot_state = state * 0;
dot_state(1) = P_e/m + g * sin(theta);
dot_state(2) = v * cos(theta);
dot_state(3) = v * sin(theta);
if v == 0
    dot_state(4) = 0;
else
    dot_state(4) = P_e/(m * v) * alpha + g/v * cos(theta);
end
end

