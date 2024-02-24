%% ������ؿ��ƹ�ϵ����
function n_y2 = NormalOverload_y2(v,x,y,theta)

% ������ȡ
global x_T K;

% �������н׶�
if x >= 0 && x < 9100
    theta_c = atan(-2 * 0.314 * 1.1 * sin(0.000314 * 1.1 * x));
    dot_theta_c = -2000 * 0.000314^2 * 1.1^2 * cos(0.000314 * 1.1 * x) * 1/sec(theta_c)^2 * v * cos(theta);
    n_y2 = v/GravityConstant(y) * dot_theta_c + cos(theta_c);
elseif x >= 9100 && x < 24000
    n_y2 = 1;

% �������н׶�
else
    r = sqrt((x_T - x)^2 + y^2);
    q = -atan(y/(x_T - x));
    n_y2 = K * v^2/(GravityConstant(y) * r) * sin(q - theta) + cos(theta);
% else
%     disp('������ؿ����������');
end
end

