%质量函数
function m = mass(t)
m_s = 28.57;%质量秒流量

m = 8000 - m_s * t;
end
