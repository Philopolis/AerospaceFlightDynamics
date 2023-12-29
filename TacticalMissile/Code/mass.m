%% 质量函数
function m = mass(t,x)

m_0 = 320;%初始质量
m_s = 0.46;%质量秒流量

if x < 9100
    m = m_0;
else
    m = m_0 - m_s .* t;
end
end

