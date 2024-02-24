%% 推力函数
function P_e = Propulsion(x)

% 常数提取
global P0 x_T;

if x < 9100 && x >=0
    P_e = 0;
elseif x >= 9100
    P_e = P0;
else
    disp('推力函数输入错误');
end
end

