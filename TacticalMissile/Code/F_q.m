function F6 = F_q(v,r,q,theta)
if r == 0
    F6 = 0;
else
    F6 = v/r .* sin(q - theta);
end
end

