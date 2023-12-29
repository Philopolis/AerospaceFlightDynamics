%% 推力函数
function P_e = Propulsion(x)

P_0 = 2000;%发动机推力

if x < 9100 && x >=0
    P_e = 0;
else if x >= 9100 && x <= 30000
        P_e = P_0;
    else
        disp('Wrong x in Propulsion');
    end
end
end

