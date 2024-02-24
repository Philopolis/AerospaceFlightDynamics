%% main func
close all; clear all; clc;
format compact; format long;
%% 常数
% 地理常数
global rho0 T0 g0 R_e m0 m_s P0 C_yalpha C_ydelta_z m_zalpha m_zdelta_z S x_T y_T K;
rho0 = 1.2495; % 标准海平面大气密度
T0 = 288.15; % 标准海平面大气温度
g0 = 9.81; % 标准海平面重力加速度
R_e = 6371000; % 地球平均半径

% 导弹结构参数
m0 = 320; % 初始质量
m_s = 0.46; % 质量秒流量
P0 = 2000; % 发动机推力

% 导弹气动参数
C_yalpha = 18/pi; % 攻角升力系数
C_ydelta_z = 18/(5 * pi); % 舵偏角升力系数
m_zalpha = -27/(25 * pi); % 攻角力矩系数
m_zdelta_z = 189/(125 * pi); % 舵偏角力矩系数
S = 0.45; % 参考面积

% 导弹导引参数
x_T = 30000;
y_T = 0;
K = 3; % 比例导引法
%% 预处理
% 时间与步长
t0 = 0;
tf_guess = 150; % 预测结束时间
step = 0.01;

% 初始状态量
state0 = [250;0;7000;0];

% 初始化储存数组
state_storage = zeros(4,(tf_guess - t0)/step + 1);
t_storage = zeros(1,(tf_guess - t0)/step + 1);

% 赋初值
i = 1;
state_storage(:,i) = state0;
t_storage(i) = t0;
%% 循环迭代解算
while(1)
    % 递推
    [state1,t1] = RK4(state0,t0,step);

    % 检查程序
    if(sum(isnan(state1)))
        disp('程序出错，检查代码')
        break;
    end

    % 仿真终止判断
    flag = Judgment(state1);
    if flag == 0
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
[structCal] = DataTreatment(state_storage,t_storage);
Draw(structCal);