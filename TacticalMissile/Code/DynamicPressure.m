%% 动压函数
function q = DynamicPressure(y,v)

rho = AtmosDensity(y);

q = 1/2 .* rho .* v.^2;
end

