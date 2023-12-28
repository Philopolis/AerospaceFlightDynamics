%% 导弹结构参数
m_0 = 320;%初始质量
m_s = 0.46;%质量秒流量
P_0 = 2000;%发动机推力

%% 导弹气动参数
C_yalpha = 18/pi;%攻角升力系数
C_ydelta_z = 18/(5 * pi);%舵偏角升力系数
m_zalpha = -27/(25 * pi);%攻角力矩系数
m_zdelta_z = 189/(125 * pi);%舵偏角力矩系数
S = 0.45;%参考面积
%阻力系数需在Resistance函数下修改

%% 其他常数
g_0 = 9.81;%标准海平面重力加速度
R_e = 6371000;%地球平均半径
rho_0 = 1.2495;%标准海平面大气密度
T_0 = 288.15;%标准海平面大气温度

%% 目标参数
x_T = 30000;
y_T = 0;

%% 比例导引法
K = 3;