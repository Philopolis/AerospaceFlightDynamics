%main func
close all;
clear all;clc;

%ʱ���벽��
t_start = 0;
t_end = 150;
step = 0.1;

%�ȶ����̲���
A_phi = 35;%�Ƕ�����ϵ��
P_e = 200000;%����������
g = -9.8;

%��������˶����������
%�������
syms v theta x y alpha m phi_pr
varvec = [v theta x y alpha m phi_pr];
%��ֵ
v_0 = 0;
theta_0 = pi/2;
x_0 = 0;
y_0 = 0;
alpha_0 = 0;
m_0 = 8000;
phi_pr0 = pi/2;
R_0 = [v_0 theta_0 x_0 y_0 alpha_0 m_0 phi_pr0];

%������������
[v,v_d,theta,theta_d,x,y,alpha,m,phi_pr,t] = RK4(step,t_start,t_end,A_phi,P_e,g,R_0,varvec)
%������µ��ٶ���ʧ��
v_1k = sum(-g * step * sin(theta));

figure
plot(t,v,'black','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('{\itv} m/s','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('�ٶ�-ʱ������','FontSize',10);

figure
plot(x,y,'black','LineWidth',1.0);
xlabel('{\itx} /m','FontName','Times New Roman','FontSize',10);
ylabel('{\ity} /m','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('����켣','FontSize',10);

figure
hold on;
plot(t,theta .* 180/pi,'black','LineWidth',1.0);
plot(t,alpha .* 180/pi,'black--','LineWidth',1.0);
plot(t,phi_pr .* 180/pi,'black:','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('��','FontName','Times New Roman','FontSize',10,'Rotation',0);
legend('�������','����','�����','FontSize',10);
title('�������/����/�����-ʱ������','FontSize',10);
hold off;

figure
hold on;
P_ey = P_e * ones(size(t));
plot(t,P_ey,'black','LineWidth',1.0);
plot(t,v_d .* m,'black--','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
legend('{\itP}_e','{\itP}_e+{\itmg}sin{\it\theta}','FontName','Times New Roman','FontSize',10);
title('��������ʱ��仯����','FontSize',10);
hold off;

figure
hold on;
plot(t,v_d/(-g) + sin(theta),'black','LineWidth',1.0);
plot(t,v/(-g) .* theta_d + cos(theta),'black:','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
legend('�������','�������','FontSize',10);
title('����-ʱ������','FontSize',10);
hold off;