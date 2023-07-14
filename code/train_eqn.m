function dydt = train_eqn(t, y, F_t, F_b, m)
% 列车速度和位置随时间的微分方程
dydt = zeros(2, 1);
if y(1) > 0
    dydt(1) = (F_t - 0.1*y(1)^2)/m;
else
    dydt(1) = (F_b - 0.1*y(1)^2)/m;
end
dydt(2) = y(1);
end