function F1 = F_v(v,theta,x,y,alpha_b,t)
F1 = (Propulsion(x) .* cos(alpha_b) - Resistance(alpha_b,y,v))/mass(t,x) - GravityConstant(y) .* sin(theta);
end

