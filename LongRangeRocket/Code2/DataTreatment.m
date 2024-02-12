%% 数据处理模块
function [structState] = DataTreatment(state_storage,t_storage,Constant)
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
    [varvec,others] = IntermediateVariable(state_storage(:,Index(i)),t_storage(Index(i)),Constant);
    structState.alpha(i) = varvec(2);
    structState.P_e(i) = others(1);
    structState.P_ex(i) = others(2);
    structState.n_x1(i) = others(3);
    structState.n_y1(i) = others(4);
    structState.n_x2(i) = others(5);
    structState.n_y2(i) = others(6);
    structState.phi_pr(i) = others(7);
end
end

