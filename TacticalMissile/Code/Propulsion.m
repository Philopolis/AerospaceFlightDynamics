%ÍÆÁ¦º¯Êý
function P_e = Propulsion(x)
run('Constants.m');

if x < 9100 && x >=0
    P_e = 0;
else if x >= 9100 && x <= 30000
        P_e = P_0;
    else
        disp('Wrong x in Propulsion');
    end
end
end

