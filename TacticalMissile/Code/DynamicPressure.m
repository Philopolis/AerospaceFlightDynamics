%¶¯Ñ¹º¯Êý
function q = DynamicPressure(y,v)

rho = AtmosDensity(y);

q = 1/2 .* rho .* v.^2;
end

