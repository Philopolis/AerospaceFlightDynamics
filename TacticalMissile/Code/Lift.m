%ÉýÁ¦º¯Êý
function Y = Lift(alpha,delta_z,y,v)
run('Constants.m');

q = DynamicPressure(y,v);

Y = (C_yalpha .* alpha + C_ydelta_z .* delta_z) .* q .* S;
end

