%ÖØÁ¦º¯Êı
function G = Gravity(t,x,y)

G = mass(t,x) .* GravityConstant(y);
end

