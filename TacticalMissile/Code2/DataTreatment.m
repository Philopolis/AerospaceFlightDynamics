%% 数据处理模块
function [structState] = DataTreatment(state_storage,t_storage)
N = length(t_storage);
Index = 1:N;
% Index = [1:n:N,N]; 数据点间隔n的数组

% 数据处理
structState.t = t_storage;
structState.v = state_storage(1,:);
structState.x = state_storage(2,:);
structState.y = state_storage(3,:);
structState.theta = state_storage(4,:);

for i = 1:length(Index)
    [varvec,others] = IntermediateVariable(state_storage(:,Index(i)),t_storage(Index(i)));
    structState.alpha_b(i) = varvec(6);
    structState.delta_zb(i) = others(1);
    structState.vartheta(i) = others(2);
end
end

