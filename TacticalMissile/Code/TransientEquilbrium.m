%% 瞬时平衡假设
function delta_z = TransientEquilbrium(alpha)

m_zalpha = -27/(25 * pi);%攻角力矩系数
m_zdelta_z = 189/(125 * pi);%舵偏角力矩系数

delta_z = -m_zalpha/m_zdelta_z * alpha;
end

