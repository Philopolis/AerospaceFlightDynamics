%质量函数
function m = mass(t)

m_0 = 8000;%初始质量
m_s = 28.57;%质量秒流量

m = m_0 - m_s * t;
end

