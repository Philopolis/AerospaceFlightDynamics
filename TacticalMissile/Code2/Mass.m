%% 质量函数
function m = Mass(x,t)

% 常数提取
global m0 m_s;

if x < 9100
    m = m0;
else
    m = m0 - m_s * t;
end
end

