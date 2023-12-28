%ÖÊÁ¿º¯Êı
function m = mass(t,x)
run('Constants.m');

if x < 9100
    m = m_0;
else
    m = m_0 - m_s .* t;
end
end

