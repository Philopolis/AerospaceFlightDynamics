%% main func
close all;
clear all;
clc;

%时间与步长
t_start = 0;
t_end = 150;
step = 0.1;

%% 既定方程参数
A_phi = 35;%角度增益系数
P_e = 200000;%发动机推力
g = -9.8;

%% 火箭纵向运动方程组求解
%输入变量
syms v theta x y alpha m phi_pr;
varvec = [v theta x y alpha m phi_pr];

%初值
v_0 = 0;
theta_0 = pi/2;
x_0 = 0;
y_0 = 0;
alpha_0 = 0;
m_0 = 8000;
phi_pr0 = pi/2;
R_0 = [v_0 theta_0 x_0 y_0 alpha_0 m_0 phi_pr0];

%龙格库塔法求解
[v,v_d,theta,theta_d,x,y,alpha,m,phi_pr,t] = RK4(step,t_start,t_end,A_phi,P_e,g,R_0,varvec)

%引力项导致的速度损失量
v_1k = sum(-g * step * sin(theta));

%% 绘制图像
figure
plot(t,v,'black','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('{\itv} m/s','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('速度-时间曲线','FontSize',10);

figure
plot(x,y,'black','LineWidth',1.0);
xlabel('{\itx} /m','FontName','Times New Roman','FontSize',10);
ylabel('{\ity} /m','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('火箭轨迹','FontSize',10);

figure
hold on;
plot(t,theta .* 180/pi,'black','LineWidth',1.0);
plot(t,alpha .* 180/pi,'black--','LineWidth',1.0);
plot(t,phi_pr .* 180/pi,'black:','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('°','FontName','Times New Roman','FontSize',10,'Rotation',0);
legend('弹道倾角','攻角','程序角','FontSize',10);
title('弹道倾角/攻角/程序角-时间曲线','FontSize',10);
hold off;

figure
hold on;
P_ey = P_e * ones(size(t));
plot(t,P_ey,'black','LineWidth',1.0);
plot(t,v_d .* m,'black--','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
legend('{\itP}_e','{\itP}_e+{\itmg}sin{\it\theta}','FontName','Times New Roman','FontSize',10);
title('切向力随时间变化曲线','FontSize',10);
hold off;

figure
hold on;
plot(t,v_d/(-g) + sin(theta),'black','LineWidth',1.0);
plot(t,v/(-g) .* theta_d + cos(theta),'black:','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
legend('轴向过载','法向过载','FontSize',10);
title('过载-时间曲线','FontSize',10);
hold off;
