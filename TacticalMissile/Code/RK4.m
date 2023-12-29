%四阶龙格库塔法
function [v,theta,x,y,alpha_b,delta_zb,Theta,t,a22,a24,a25,a34,a35] = RK4(step,varvec)
%步长step

%初值
run('Constants.m');
v(1) = 250;
theta(1) = 0;
x(1) = 0;
y(1) = 7000;
alpha_b(1) = 0;
delta_zb(1) = 0;
Theta(1) = 0;
t(1) = 0;

%动力系数计算
J = 215;
m_zomega_z = -0.2;
S = 0.45;%参考面积
L = 2.5;%参考长度

%四阶龙格库塔迭代
%% 方案飞行阶段

i = 1;
while x < 24000
   
    Kv1 = F_v(v(i),theta(i),x(i),y(i),alpha_b(i),t(i));
    Ktheta1 = F_theta(v(i),theta(i),x(i),y(i),alpha_b(i),delta_zb(i),t(i));   
    Kx1 = F_x(v(i),theta(i));  
    Ky1 = F_y(v(i),theta(i)); 
    
    Kv2 = F_v(v(i) + Kv1 .* step/2,theta(i) + Ktheta1 .* step/2,x(i),y(i) + Ky1 .* step/2,alpha_b(i),t(i) + step/2);
    Ktheta2 = F_theta(v(i) + Kv1 .* step/2,theta(i) + Ktheta1 .* step/2,x(i),y(i) + Ky1 .* step/2,alpha_b(i),delta_zb(i),t(i) + step/2);
    Kx2 = F_x(v(i) + Kv1 .* step/2,theta(i) + Ktheta1 .* step/2);
    Ky2 = F_y(v(i) + Kv1 .* step/2,theta(i) + Ktheta1 .* step/2);  
    
    Kv3 = F_v(v(i) + Kv2 .* step/2,theta(i) + Ktheta2 .* step/2,x(i),y(i) + Ky2 .* step/2,alpha_b(i),t(i) + step/2);
    Ktheta3 = F_theta(v(i) + Kv2 .* step/2,theta(i) + Ktheta2 .* step/2,x(i),y(i) + Ky2 .* step/2,alpha_b(i),delta_zb(i),t(i) + step/2);
    Kx3 = F_x(v(i) + Kv2 .* step/2,theta(i) + Ktheta2 .* step/2);
    Ky3 = F_y(v(i) + Kv2 .* step/2,theta(i) + Ktheta2 .* step/2);  
    
    Kv4 = F_v(v(i) + Kv3 .* step,theta(i) + Ktheta3 .* step,x(i),y(i) + Ky3 .* step,alpha_b(i),t(i) + step);
    Ktheta4 = F_theta(v(i) + Kv3 .* step,theta(i) + Ktheta3 .* step,x(i),y(i) + Ky3 .* step,alpha_b(i),delta_zb(i),t(i) + step);
    Kx4 = F_x(v(i) + Kv3 .* step,theta(i) + Ktheta3 .* step);
    Ky4 = F_y(v(i) + Kv3 .* step,theta(i) + Ktheta3 .* step);   
    
    v(i+1) = v(i) + step/6 .* (Kv1 + 2 .* Kv2 + 2 .* Kv3 + Kv4);
    theta(i+1) = theta(i) + step/6 .* (Ktheta1 + 2 .* Ktheta2 + 2 .* Ktheta3 + Ktheta4);
    x(i+1) = x(i) + step/6 .* (Kx1 + 2 .* Kx2 + 2 .* Kx3 + Kx4);
    y(i+1) = y(i) + step/6 .* (Ky1 + 2 .* Ky2 + 2 .* Ky3 + Ky4);
    
    delta_zb(i+1) = TransientEquilbrium(alpha_b(i));
    alpha_b(i+1) = NormalOverload_y2(v(i),theta(i+1),x(i),y(i))/NormalOverload_y2alpha(v(i),x(i),y(i),alpha_b(i),t(i));%方案飞行控制方程
    Theta(i+1) = theta(i) + alpha_b(i);
    
    %动力系数
    a22(i+1) = -m_zomega_z .* DynamicPressure(y(i),v(i)) .* S .* L/J;
    a24(i+1) = -m_zalpha .* DynamicPressure(y(i),v(i)) .* S .* L/J;
    a25(i+1) = -m_zdelta_z .* DynamicPressure(y(i),v(i)) .* S .* L/J;
    a34(i+1) = (Propulsion(x(i)) + C_yalpha .* DynamicPressure(y(i),v(i)) .* S)/(mass(t(i),x(i)) .* v(i));
    a35(i+1) = C_ydelta_z .* DynamicPressure(y(i),v(i)) .* S/(mass(t(i),x(i)) .* v(i));
    
    t(i+1) = i .* step;
    i = i+1;
end

%% 导引飞行阶段

%初值
x_0 = x(i);
y_0 = y(i);
theta_0 = theta(i);
r(i) = sqrt((x_T - x_0).^2 + (y_T - y_0).^2);
q(i) = -atan(y_0/(x_T - x_0));

while x < x_T

    Kv1 = F_v(v(i),theta(i),x(i),y(i),alpha_b(i),t(i));
    Ktheta1 = F_theta(v(i),theta(i),x(i),y(i),alpha_b(i),delta_zb(i),t(i));
    Ktheta1 = double(Ktheta1);
    Kr1 = F_r(v(i),q(i),theta(i));
    Kq1 = F_q(v(i),r(i),q(i),theta(i));
    
    Kv2 = F_v(v(i) + Kv1 .* step/2,theta(i) + Ktheta1 .* step/2,x(i),y(i),alpha_b(i),t(i) + step/2);
    Ktheta2 = F_theta(v(i) + Kv1 .* step/2,theta(i) + Ktheta1 .* step/2,x(i),y(i),alpha_b(i),delta_zb(i),t(i) + step/2);
    Kr2 = F_r(v(i) + Kv1 .* step/2,q(i) + Kq1 .* step/2,theta(i) + Ktheta1 .* step/2);
    Kq2 = F_q(v(i) + Kv1 .* step/2,r(i) + Kr1 .* step/2,q(i) + Kq1 .* step/2,theta(i) + Ktheta1 .* step/2);
    
    Kv3 = F_v(v(i) + Kv2 .* step/2,theta(i) + Ktheta2 .* step/2,x(i),y(i),alpha_b(i),t(i) + step/2);
    Ktheta3 = F_theta(v(i) + Kv2 .* step/2,theta(i) + Ktheta2 .* step/2,x(i),y(i),alpha_b(i),delta_zb(i),t(i) + step/2);
    Kr3 = F_r(v(i) + Kv2 .* step/2,q(i) + Kq2 .* step/2,theta(i) + Ktheta2 .* step/2);
    Kq3 = F_q(v(i) + Kv2 .* step/2,r(i) + Kr2 .* step/2,q(i) + Kq2 .* step/2,theta(i) + Ktheta2 .* step/2); 
    
    Kv4 = F_v(v(i) + Kv3 .* step,theta(i) + Ktheta3 .* step,x(i),y(i),alpha_b(i),t(i) + step);
    Ktheta4 = F_theta(v(i) + Kv3 .* step,theta(i) + Ktheta3 .* step,x(i),y(i),alpha_b(i),delta_zb(i),t(i) + step);
    Kr4 = F_r(v(i) + Kv3 .* step,q(i) + Kq3 .* step,theta(i) + Ktheta3 .* step);
    Kq4 = F_q(v(i) + Kv3 .* step,r(i) + Kr3 .* step,q(i) + Kq3 .* step,theta(i) + Ktheta3 .* step);  
    
    v(i+1) = v(i) + step/6 .* (Kv1 + 2 .* Kv2 + 2 .* Kv3 + Kv4);
    theta(i+1) = theta(i) + step/6 .* (Ktheta1 + 2 .* Ktheta2 + 2 .* Ktheta3 + Ktheta4);
    r(i+1) = r(i) + step/6 .* (Kr1 + 2 .* Kr2 + 2 .* Kr3 + Kr4);
    q(i+1) = q(i) + step/6 .* (Kq1 + 2 .* Kq2 + 2 .* Kq3 + Kq4);
    
    delta_zb(i+1) = TransientEquilbrium(alpha_b(i));
    alpha_b(i+1) = (v(i)/GravityConstant(y(i)) .* K .* Kq1 + cos(K .* (q(i) + atan(y_0/(x_T - x_0))) + theta_0))/NormalOverload_y2alpha(v(i),x(i),y(i),alpha_b(i),t(i));%导引飞行控制方程
    Theta(i+1) = theta(i) + alpha_b(i);
    x(i+1) = x_T - r(i) .* cos(q(i));
    y(i+1) = y_T - r(i) .* sin(q(i));
    
    %动力系数
    a22(i+1) = -m_zomega_z .* DynamicPressure(y(i),v(i)) .* S .* L/J;
    a24(i+1) = -m_zalpha .* DynamicPressure(y(i),v(i)) .* S .* L/J;
    a25(i+1) = -m_zdelta_z .* DynamicPressure(y(i),v(i)) .* S .* L/J;
    a34(i+1) = (Propulsion(x(i)) + C_yalpha .* DynamicPressure(y(i),v(i)) .* S)/(mass(t(i),x(i)) .* v(i));
    a35(i+1) = C_ydelta_z .* DynamicPressure(y(i),v(i)) .* S/(mass(t(i),x(i)) .* v(i));
    
    t(i+1) = i .* step;
    i = i+1;
end
end

