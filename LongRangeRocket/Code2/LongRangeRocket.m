%% main func
close all; clear; clc;
format compact; format long;
%% 预处理
% 时间与步长
t0 = 0;
t_end = 150.0;
step = 0.1;

% 常数向量
P_e = 200 * 1000;
g = -9.8;
m_0 = 8000;
m_s = 28.57;
A_phi = 35;
Constant = [P_e;g;m_0;m_s;A_phi];

% 初始状态量
state0 = [zeros(3,1);pi/2];

% 初始化储存数组
state_storage = zeros(4,(t_end - t0)/step + 1);
t_storage = zeros(1,(t_end - t0)/step + 1);

% 赋初值
i = 1;
state_storage(:,i) = state0;
t_storage(i) = t0;
%% 循环迭代解算
while(1)
    % 递推
    [state1,t1] = RK4(state0,t0,step,Constant);

    % 检查程序
    if(sum(isnan(state1)))
        disp('程序出错，检查代码')
        break;
    end

    % 仿真终止判断
    if t1 > t_end + step/2
        break;
    else
        % 迭代赋值
        state0 = state1;
        t0 = t1;
        i = i + 1;

        % 记录数据
        state_storage(:,i) = state0;
        t_storage(i) = t0;
    end
end

% 清楚多余存储空间
state_storage(:,i+1:end) = [];
t_storage(i+1:end) = [];
%% 数据处理与绘图
[structCal] = DataTreatment(state_storage,t_storage,Constant);
Draw(structCal);