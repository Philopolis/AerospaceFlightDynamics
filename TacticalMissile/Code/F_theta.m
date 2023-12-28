function F2 = F_theta(v,theta,x,y,alpha_b,delta_zb,t)
if v == 0
    F2 = 0;
else
    F2 = (Propulsion(x) .* sin(alpha_b) + Lift(alpha_b,delta_zb,y,v))/(mass(t,x) .* v) - GravityConstant(y) .* cos(theta)/v;
end
end

