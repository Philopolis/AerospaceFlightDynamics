%����Ǻ���
function phi_pr = phi_program(t)
%��������
t1 = 10;
t2 = 130;
t3 = 150;
fig = pi/60;

if t < t1
    phi_pr = pi/2;
else if t < t2
        phi_pr = pi/2 + (pi/2 - fig) * ((t-t1)^2/(t2-t1)^2 - 2 * (t-t1)/(t2-t1));
    else
        phi_pr = fig;
    end
end
end