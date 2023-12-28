%四阶龙格库塔法
function [v,v_d,theta,theta_d,x,y,alpha,m,phi_pr,t] = RK4(step,a,b,A_phi,P_e,g,R_0,varvec)
%步长step
%下限a
%上限b

t = a:step:b;
N = (b - a)/step;

%赋初值
v(1) = R_0(1,1);
theta(1) = R_0(1,2);
x(1) = R_0(1,3);
y(1) = R_0(1,4);
alpha(1) = R_0(1,5);
m(1) = R_0(1,6); 
phi_pr(1) = R_0(1,7);
v_d(1) = 0;
theta_d(1) = 0;

%方程组函数
    function F1 = F_v(t,theta)
        F1 = P_e/mass(t) + g * sin(theta);
    end

    function F2 = F_theta(alpha,t,v,theta)
        if v == 0
            F2 = 0;
        else F2 = (P_e * alpha)/(mass(t) * v) + g/v * cos(theta);
        end
    end

    function F3 = F_x(v,theta)
        F3 = v * cos(theta);
    end

    function F4 = F_y(v,theta)
        F4 = v * sin(theta);
    end

%四阶龙格库塔迭代
for i = 1:N
    
    Kv1 = F_v(t(i),theta(i));
    Ktheta1 = F_theta(alpha(i),t(i),v(i),theta(i));
    Kx1 = F_x(v(i),theta(i));
    Ky1 = F_y(v(i),theta(i));
    
    v_d(i+1) = Kv1;
    theta_d(i+1) = Ktheta1;
    
    Kv2 = F_v(t(i) + step/2,theta(i) + Ktheta1 * step/2);
    Ktheta2 = F_theta(alpha(i),t(i) + step/2,v(i) + Kv1 * step/2,theta(i) + Ktheta1 * step/2);
    Kx2 = F_x(v(i) + Kv1 * step/2,theta(i) + Ktheta1 * step/2);
    Ky2 = F_y(v(i) + Kv1 * step/2,theta(i) + Ktheta1 * step/2);
    
    Kv3 = F_v(t(i) + step/2,theta(i) + Ktheta2 * step/2);
    Ktheta3 = F_theta(alpha(i),t(i) + step/2,v(i) + Kv2 * step/2,theta(i) + Ktheta2 * step/2);
    Kx3 = F_x(v(i) + Kv2 * step/2,theta(i) + Ktheta2 * step/2);
    Ky3 = F_y(v(i) + Kv2 * step/2,theta(i) + Ktheta2 * step/2);
    
    Kv4 = F_v(t(i) + step,theta(i) + Ktheta3 * step);
    Ktheta4 = F_theta(alpha(i),t(i) + step,v(i) + Kv3 * step,theta(i) + Ktheta3 * step);
    Kx4 = F_x(v(i) + Kv3 * step,theta(i) + Ktheta3 * step);
    Ky4 = F_y(v(i) + Kv3 * step,theta(i) + Ktheta3 * step);
    
    v(i+1) = v(i) + step/6 * (Kv1 + 2 * Kv2 + 2 * Kv3 + Kv4);
    theta(i+1) = theta(i) + step/6 * (Ktheta1 + 2 * Ktheta2 + 2 * Ktheta3 + Ktheta4);
    x(i+1) = x(i) + step/6 * (Kx1 + 2 * Kx2 + 2 * Kx3 + Kx4);
    y(i+1) = y(i) + step/6 * (Ky1 + 2 * Ky2 + 2 * Ky3 + Ky4);
    
    alpha(i+1) = A_phi * (phi_pr(i) - theta(i));
    m(i+1) = mass(i*step);
    phi_pr(i+1) = phi_program(i*step);
    
end
end
