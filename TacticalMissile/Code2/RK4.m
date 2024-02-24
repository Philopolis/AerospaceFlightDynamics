%% 四阶龙格库塔法
function [X1,t1] = RK4(X0,t0,h)

K1 = Equations(X0,t0);
K2 = Equations(X0 + K1 * h/2,t0 + h/2);
K3 = Equations(X0 + K2 * h/2,t0 + h/2);
K4 = Equations(X0 + K3 * h,t0 + h);

X1 = X0 + (K1 + 2 * K2 + 2 * K3 + K4) * h/6;
t1 = t0 + h;

end

