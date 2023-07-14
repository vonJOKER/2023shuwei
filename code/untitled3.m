% 列车质量
m = 176300;

% 牵引力和制动力
F_t = 310000;
F_b = 760000;

% 列车初始速度和距离
v0 = 0;
s0 = 0;

% 模拟时间和时间步长
tspan = [0, 500000];
dt = 0.1;

% 使用 ode45 求解速度和距离随时间的变化
[t, y] = ode45(@(t, y) train_eqn(t, y, F_t, F_b, m), tspan, [v0, s0]);

% 计算牵引力和制动力随距离的变化
F = zeros(size(y, 1), 1);
for i = 1:size(y, 1)
    if y(i, 1) > 0
        F(i) = F_t;
    else
        F(i) = F_b;
    end
end

% 绘制牵引力、制动力和距离随距离的变化曲线
figure;
yyaxis left;
plot(y(:, 2), F/1000, 'b-', 'LineWidth', 2);
xlabel('Distance (m)', 'FontSize', 11);
ylabel('Force (kN)', 'FontSize', 11);
ylim([-2, 12]);
yyaxis right;
plot(y(:, 2), y(:, 1), 'r-', 'LineWidth', 2);
ylabel('Velocity (m/s)', 'FontSize', 11);
ylim([0, 60]);
title('Train Dynamics', 'FontSize', 12);
legend('Force', 'Velocity');
