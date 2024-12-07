%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

% Clear the workspace
clear all;
close all;

% Initial state
starting_system = [0 0 0 0];
timespan = 0 : 0.01 : 15;

alpha = 1.5;
beta = 2;
g1 = 4;
g2 = 2;
flag_case = 0;
n0 = 0.25;
f = 15;

% Parallel structure without noise
[t, par_ode_no_noise] = ode45(@(t, ode_state)dynamics_par(t, ode_state, alpha, beta, g1, g2, flag_case, n0, f), timespan, starting_system);
par_x_no_noise = par_ode_no_noise(:, 1);
par_theta_hat1_no_noise = par_ode_no_noise(:, 2);
par_theta_hat2_no_noise = par_ode_no_noise(:, 3);
par_x_hat_no_noise = par_ode_no_noise(:, 4);

% Parallel structure without noise
flag_case = 1;
[t, par_ode_with_noise] = ode45(@(t, ode_state)dynamics_par(t, ode_state, alpha, beta, g1, g2, flag_case, n0, f), timespan, starting_system);
par_x_with_noise = par_ode_with_noise(:, 1);
par_theta_hat1_with_noise = par_ode_with_noise(:, 2);
par_theta_hat2_with_noise = par_ode_with_noise(:, 3);
par_x_hat_with_noise = par_ode_with_noise(:, 4);

%Compute lyapunov function for parallel structure
par_v_lyap_no_noise = zeros(length(timespan), 1);
par_v_lyap_with_noise = zeros(length(timespan), 1);
for k = 1 : length(timespan)
 par_v_lyap_no_noise(k) = (1 / 2) * ((par_x_no_noise(k) - par_x_hat_no_noise(k)) ^ 2 + (1 / g1)*(par_theta_hat1_no_noise(k) - alpha) ^ 2 +(1 / g2) * (par_theta_hat2_no_noise(k) - beta) ^ 2);
 par_v_lyap_with_noise(k) = (1 / 2)* ((par_x_with_noise(k) - par_x_hat_with_noise(k)) ^ 2 + (1 / g1) * (par_theta_hat1_with_noise(k) - alpha) ^ 2 +(1 / g2) * (par_theta_hat2_with_noise(k) - beta) ^ 2);
end

% Initial state
starting_system = [0 0 0 0];
timespan = 0 : 0.01 : 15;

alpha = 1.5;
beta = 2;
g1 = 4;
g2 = 2;
flag_case = 0;
n0 = 0.25;
f = 15;
theta_m = 5;

% Mixed structure without noise
[t, mix_ode_no_noise] = ode45(@(t, ode_state)dynamics_mix(t, ode_state, alpha, beta, g1, g2, theta_m, flag_case, n0, f), timespan, starting_system);
mix_x_no_noise = mix_ode_no_noise(:, 1);
mix_theta_hat1_no_noise = mix_ode_no_noise(:, 2);
mix_theta_hat2_no_noise = mix_ode_no_noise(:, 3);
mix_x_hat_no_noise = mix_ode_no_noise(:, 4);

% Mixed structure with noise
flag_case = 1;
[t, mix_ode_with_noise] = ode45(@(t, ode_state)dynamics_mix(t, ode_state, alpha, beta, g1, g2, theta_m, flag_case, n0, f), timespan, starting_system);
mix_x_with_noise = mix_ode_with_noise(:, 1);
mix_theta_hat1_with_noise = mix_ode_with_noise(:, 2);
mix_theta_hat2_with_noise = mix_ode_with_noise(:, 3);
mix_x_hat_with_noise = mix_ode_with_noise(:, 4);

% Compute lyapunov function for parallel structure
mix_v_lyap_no_noise = zeros(length(timespan), 1);
mix_v_lyap_with_noise = zeros(length(timespan), 1);
for k = 1 : length(timespan)
 mix_v_lyap_no_noise(k) = (1 / 2) * ((mix_x_no_noise(k) - mix_x_hat_no_noise(k)) ^ 2 + (1 / g1)*(mix_theta_hat1_no_noise(k) - alpha) ^ 2 +(1 / g2) * (mix_theta_hat2_no_noise(k) - beta) ^ 2);
 mix_v_lyap_with_noise(k) = (1 / 2)* ((mix_x_with_noise(k) - mix_x_hat_with_noise(k)) ^ 2 + (1 / g1) * (mix_theta_hat1_with_noise(k) - alpha) ^ 2 +(1 / g2) * (mix_theta_hat2_with_noise(k) - beta) ^ 2);
end

% Plots for parallel and mixed structure
% No Noise parallel
% figure;
% plot(timespan, par_x_no_noise)
% title('Real x - Parallel Structure');
% ylabel('x');
% xlabel('Time (sec)');
% 
% figure;
% plot(timespan , par_x_hat_no_noise)
% title('xhat - Parallel Structure');
% ylabel('xhat');
% xlabel('Time (sec)');
% 
% e = par_x_no_noise - par_x_hat_no_noise;
% figure;
% plot(timespan , e)
% title('Error- Parallel Structure');
% ylabel('e');
% xlabel('Time (sec)');
% figure;
% 
% plot(timespan, par_theta_hat1_no_noise, timespan, par_theta_hat2_no_noise);
% title('thetahat1, thetahat2 - Parallel Structure');
% legend('Thetahat_1', 'Thetahat_2');
% figure;
% 
% plot(timespan , par_v_lyap_no_noise);
% title('Lyapunov function - Parallel Structure');
% ylabel('V');
% xlabel('Time (sec)');
% 
% 
% % No noise mixed
% figure;
% plot(timespan, mix_x_no_noise)
% title('Real x - Mixed Structure');
% ylabel('x');
% xlabel('Time (sec)');
% 
% figure;
% plot(timespan , mix_x_hat_no_noise)
% title('xhat - Mixed Structure');
% ylabel('xhat');
% xlabel('Time (sec)');
% 
% e = mix_x_no_noise - mix_x_hat_no_noise;
% figure;
% plot(timespan , e)
% title('Error- Mixed Structure');
% ylabel('e');
% xlabel('Time (sec)');
% figure;
% 
% plot(timespan, mix_theta_hat1_no_noise, timespan, mix_theta_hat2_no_noise);
% title('thetahat1, thetahat2 - Mixed Structure');
% legend('Thetahat_1', 'Thetahat_2');
% figure;
% 
% plot(timespan , mix_v_lyap_no_noise);
% title('Lyapunov function - Mixed Structure');
% ylabel('V');
% xlabel('Time (sec)');

% Plots for 2 structures with noise
% With Noise parallel
figure;
plot(timespan, par_x_with_noise)
title('Real x - Parallel Structure');
ylabel('x');
xlabel('Time (sec)');

figure;
plot(timespan , par_x_hat_with_noise)
title('xhat - Parallel Structure');
ylabel('xhat');
xlabel('Time (sec)');

e = par_x_with_noise - par_x_hat_with_noise;
figure;
plot(timespan , e)
title('Error- Parallel Structure');
ylabel('e');
xlabel('Time (sec)');
figure;

plot(timespan, par_theta_hat1_with_noise, timespan, par_theta_hat2_with_noise);
title('thetahat1, thetahat2 - Parallel Structure');
legend('Thetahat_1', 'Thetahat_2');
figure;

plot(timespan , par_v_lyap_with_noise);
title('Lyapunov function - Parallel Structure');
ylabel('V');
xlabel('Time (sec)');


% With noise mixed
figure;
plot(timespan, mix_x_with_noise)
title('Real x - Mixed Structure');
ylabel('x');
xlabel('Time (sec)');

figure;
plot(timespan , mix_x_hat_with_noise)
title('xhat - Mixed Structure');
ylabel('xhat');
xlabel('Time (sec)');

e = mix_x_with_noise - mix_x_hat_with_noise;
figure;
plot(timespan , e)
title('Error- Mixed Structure');
ylabel('e');
xlabel('Time (sec)');
figure;

plot(timespan, mix_theta_hat1_with_noise, timespan, mix_theta_hat2_with_noise);
title('thetahat1, thetahat2 - Mixed Structure');
legend('Thetahat_1', 'Thetahat_2');
figure;

plot(timespan , mix_v_lyap_with_noise);
title('Lyapunov function - Mixed Structure');
ylabel('V');
xlabel('Time (sec)');


