%% 判断是否完成任务
function flag = Judgment(state0)
global x_T
x = state0(2);
if x >= x_T
    flag = 0;
else
    flag = 1;
end
end

