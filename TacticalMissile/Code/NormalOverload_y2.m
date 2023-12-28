%法向过载控制关系函数
function n_y2 = NormalOverload_y2(v,theta,x,y)

if x >= 0 && x < 9100
    
    syms t;
    f = atan(-2 .* 0.314 .* 1.1 .* sin(0.000314 .* 1.1 .* t));
    df = diff(f,t);
    
    n_y2 = (subs(df,t,x) .* v.^2/GravityConstant(y) +1).* cos(subs(f,t,x));
    
%     syms t;
%     f = asin(-2 .* 0.314 .* 1.1 .* sin(0.000314 .* 1.1 .* t) .* cos(theta));
%     df = diff(f,t);
%     
%     n_y2 = v.^2/GravityConstant(y) .* cos(theta) .* subs(df,t,x) + cos(subs(f,t,x));
    
else if x >= 9100 && x < 24000
        n_y2 = 1;
    else
        disp('Wrong x in NormalOverload_y2');
    end
end
end

