%% main func
%�ó�������һ������ʱ��ԼΪ455s

close all;
clear all;
clc;

%����
step = 0.01;

%Ǧ��ƽ�浼�������˶����������
%�������
syms v theta x y alpha_b delta_zb
varvec = [v theta x y alpha_b delta_zb];

%������������
[v,theta,x,y,alpha_b,delta_zb,Theta,t,a22,a24,a25,a34,a35] = RK4(step,varvec)

%% ��������

figure
plot(t,v,'black','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('{\itV} m/s','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('�ٶ�-ʱ������','FontSize',10);

figure
plot(x,y,'black','LineWidth',1.0);
xlabel('{\itx} /m','FontName','Times New Roman','FontSize',10);
ylabel('{\ity} /m','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('��������','FontSize',10);

figure
hold on;
plot(t,alpha_b .* 180/pi,'black','LineWidth',1.0);
plot(t,delta_zb .* 180/pi,'black','LineWidth',1.0);
plot(t,theta .* 180/pi,'black:','LineWidth',1.0);
plot(t,Theta .* 180/pi,'black--','LineWidth',1.0);
indices = round(linspace(1,length(t),20));
plot(t(indices),delta_zb(indices) .* 180/pi,'black+','LineWidth',1.0); 
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('��','FontName','Times New Roman','FontSize',10,'Rotation',0);
legend('����','+��ƫ��','�������','��̬��','FontSize',10);
title('���ǣ���ƫ�ǣ�������ǣ���̬��-ʱ������','FontSize',10);
hold off;

% %����ϵ������
% figure
% plot(t,a22,'black','LineWidth',1.0);
% xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
% ylabel('a_{22}','FontName','Times New Roman','FontSize',10,'Rotation',0);
% 
% figure
% plot(t,a24,'black','LineWidth',1.0);
% xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
% ylabel('a_{24}','FontName','Times New Roman','FontSize',10,'Rotation',0);
% 
% figure
% plot(t,a25,'black','LineWidth',1.0);
% xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
% ylabel('a_{25}','FontName','Times New Roman','FontSize',10,'Rotation',0);
% 
% figure
% plot(t,a34,'black','LineWidth',1.0);
% xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
% ylabel('a_{34}','FontName','Times New Roman','FontSize',10,'Rotation',0);
% 
% figure
% plot(t,a35,'black','LineWidth',1.0);
% xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
% ylabel('a_{35}','FontName','Times New Roman','FontSize',10,'Rotation',0);