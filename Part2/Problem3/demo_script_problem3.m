%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 3
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

% Clear the workspace
clear all;
close all;

% Initialize the system
starting_system = [0 0 0 0 0 0 0 0 0 0];
timespan = 0 : 0.001 : 50;

A_matrix = [-0.5 -3; 4 -2];
B_matrix = [1; 1.4];
g1 = 5; 
g2 = 2;

[t, lyap_sys] = ode45(@(t, ode_state)lyapunov_method(t, ode_state, A_matrix(1, 1), A_matrix(1, 2), A_matrix(2, 1), A_matrix(2, 2), B_matrix(1, 1), B_matrix(2, 1), g1, g2), timespan, starting_system);

x1 = lyap_sys(:, 1);
x2 = lyap_sys(:, 2);
x_real = [x1; x2];

x1_hat = lyap_sys(:, 3);
x2_hat = lyap_sys(:, 4);
x_hat = [x1_hat; x2_hat];

a11_hat = lyap_sys(:, 5);
a12_hat = lyap_sys(:, 6);
a21_hat = lyap_sys(:, 7);
a22_hat = lyap_sys(:, 8);
A_hat = [a11_hat a12_hat; a21_hat a22_hat];

b1_hat = lyap_sys(:, 9);
b2_hat = lyap_sys(:, 10);
B_hat = [b1_hat; b2_hat];

e = x_real - x_hat;

A_tilde = [a11_hat - A_matrix(1, 1) a12_hat - A_matrix(1, 2) a21_hat - A_matrix(2, 1) a22_hat - A_matrix(2, 2)];
B_tilde = [b1_hat - B_matrix(1, 1) b2_hat - B_matrix(2, 1)];

v_lyap = zeros(length(timespan), 1);
for k = 1 : length(timespan)
    v_lyap(k) = (1 / 2) * ((e(k, :)' * e(k, :)) ^ 2 + (1 / g1) * trace(A_tilde(k, :)' * A_tilde(k, :)) + (1 / g2) * trace(B_tilde(k, :)' * B_tilde(k, :)));
end

% Plots for the system
figure;
plot(timespan, x1);
title('Real x1');
ylabel('x');
xlabel('Time (sec)');

figure;
plot(timespan, x1_hat);
title('x1 hat');
ylabel('x1hat');
xlabel('Time (sec)');

figure;
plot(timespan, x1 - x1_hat);
title('Error x1');
ylabel('e1');
xlabel('Time (sec)');

figure;
plot(timespan, x2);
title('Real x2');
ylabel('x');
xlabel('Time (sec)');

figure;
plot(timespan, x2_hat);
title('x2 hat');
ylabel('x2hat');
xlabel('Time (sec)');

figure;
plot(timespan, x2 - x2_hat);
title('Error x2');
ylabel('e2');
xlabel('Time (sec)');
figure;

plot(timespan, a11_hat, timespan, a12_hat, timespan, a21_hat, timespan,a22_hat);
legend('a_{11}','a_{12}','a_{21}','a_{22}');
title('Hat  Values of matrix A');
ylabel('A');
xlabel('Time (sec)');
figure;

plot(timespan, b1_hat, timespan, b2_hat);
legend('b_1','b_2');
title('Hat  Values of matrix B');
ylabel('B');
xlabel('Time (sec)');
figure; 

plot(timespan, v_lyap);
title('Lyapunov function');
ylabel('V');
xlabel('Time (sec)');


