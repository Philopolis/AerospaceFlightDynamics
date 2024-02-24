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
title('导弹弹道','FontSize',10);

figure(3)
hold on;
plot(structCal.t,structCal.alpha_b * deg,'black-','LineWidth',1.0);
plot(structCal.t,structCal.delta_zb * deg,'black:','LineWidth',1.0);
plot(structCal.t,structCal.theta * deg,'black-o','MarkerIndices',1:1500:length(structCal.t),'LineWidth',1.0);
plot(structCal.t,structCal.vartheta * deg,'black-x','MarkerIndices',1:1500:length(structCal.t),'LineWidth',1.0);
xlabel('{\itt} /s','FontName','Times New Roman','FontSize',10);
ylabel('°','FontName','Times New Roman','FontSize',10,'Rotation',0);
legend('攻角','舵偏角','弹道倾角','俯仰角','FontSize',10);
title('角度-时间曲线','FontSize',10);
end

