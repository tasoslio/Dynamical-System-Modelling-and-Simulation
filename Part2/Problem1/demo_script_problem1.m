%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

% Clear the workspace
clear all;
close all;

% Initialize parameters
alpha = 1.5;
beta = 2;
am = 3;
gamma = 20;

% Initial state
starting_system = [0 0 0 0 0];
timespan = 0 : 0.01 : 15;

% time system's states
[t, ode_state] = ode45(@(t, ode_state)dynamics_func(t, ode_state, alpha, beta, am, gamma, 1), timespan, starting_system);
x = ode_state(:, 1);
phi1 = ode_state(:, 2);
phi2 = ode_state(:, 3);
theta_hat1 = ode_state(:, 4);
theta_hat2 = ode_state(:, 5);

% Compute x_hat
x_hat = zeros(length(timespan), 1);
for k = 1 : length(timespan)
    x_hat(k) = theta_hat1(k) * phi1(k) + theta_hat2(k) * phi2(k);
end

alpha_hat = am - theta_hat1;
beta_hat = theta_hat2;

% Compute Lyapunov function
v_lyap = zeros(length(timespan), 1);
for k = 1 : length(timespan)
    v_lyap(k) = (1 / 2) * (alpha_hat(k) - alpha) ^ 2 + (1 / 2) * (beta_hat(k) - beta) ^ 2;
end

% Plots
figure;
plot(timespan, x);
title('Real x');
ylabel('x');
xlabel('Time (sec)');

figure;
plot(timespan, x_hat);
title('Estimated x');
ylabel('x_hat');
xlabel('Time (sec)');

e = x - x_hat;
figure;
plot(timespan, e);
title('Error x');
ylabel('x - x_hat');
xlabel('Time (sec)');

figure;
plot(timespan, alpha_hat);
title('Estimated a');
ylabel('alpha_hat');
xlabel('Time (sec)');

figure;
plot(timespan, beta_hat);
title('Estimated b');
ylabel('beta_hat');
xlabel('Time (sec)');

figure;
plot(timespan, v_lyap)
title('V Lyapunov Function');
ylabel('v_lyap');
xlabel('Time (sec)');







