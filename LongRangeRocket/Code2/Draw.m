%% 绘制图像
function Draw(structCal)
deg = 180/pi;

figure(1)
plot(structCal.t,structCal.v,'black','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('{\itv} m/s','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('速度-时间曲线','FontSize',10);

figure(2)
plot(structCal.x,structCal.y,'black','LineWidth',1.0);
xlabel('{\itx} /m','FontName','Times New Roman','FontSize',10);
ylabel('{\ity} /m','FontName','Times New Roman','FontSize',10,'Rotation',0);
title('火箭轨迹','FontSize',10);

figure(3)
hold on;
plot(structCal.t,structCal.theta * deg,'black','LineWidth',1.0);
plot(structCal.t,structCal.alpha * deg,'black--','LineWidth',1.0);
plot(structCal.t,structCal.phi_pr * deg,'black:','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('°','FontName','Times New Roman','FontSize',10,'Rotation',0);
legend('弹道倾角','攻角','程序角','FontSize',10);
title('弹道倾角/攻角/程序角-时间曲线','FontSize',10);

figure(4)
hold on;
plot(structCal.t,structCal.P_e,'black','LineWidth',1.0);
plot(structCal.t,structCal.P_ex,'black--','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
legend('{\itP}_e','{\itP}_e+{\itmg}sin{\it\theta}','FontName','Times New Roman','FontSize',10);
title('切向力随时间变化曲线','FontSize',10);

figure(5)
hold on;
plot(structCal.t,structCal.n_x1,'black','LineWidth',1.0);
plot(structCal.t,structCal.n_y1,'black:','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
legend('轴向过载','法向过载','FontSize',10);
title('箭体过载-时间曲线','FontSize',10);

figure(6)
hold on;
plot(structCal.t,structCal.n_x2,'black','LineWidth',1.0);
plot(structCal.t,structCal.n_y2,'black:','LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
legend('轴向过载','法向过载','FontSize',10);
title('弹道过载-时间曲线','FontSize',10);
end

