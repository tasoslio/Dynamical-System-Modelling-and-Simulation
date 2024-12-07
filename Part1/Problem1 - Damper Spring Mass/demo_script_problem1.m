%% 1st Assignment of Dynamic System Modeling and Simulation Problem 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

% Initialize parameters
mass = 10;
b_damp = 0.3;
k_spring = 1.5;

% Define initial states
y0(1) = 0;
y0(2) = 0;
timespan = 0 : 0.1 : 10;

% Start simulation with ode45 function
[time, state] = ode45(@(t, state)dynamics_func(t, state, mass, b_damp, k_spring), timespan, y0);

% Define real y with the first state of time
y = state(:, 1);

[mass_hat, b_damp_hat, k_spring_hat, theta_hat, y_hat] = least_square_method(y);

% Plot real value y
figure(1);
plot(timespan, y);
title('Real Value y');
ylabel('y real');
xlabel('time (sec)');

% Plot predicted value y
figure(2);
plot(timespan, y_hat);
title('Predicted value y');
ylabel('y_hat');
xlabel('time (sec)');

% Plot error 
figure(3);
error = y - y_hat;
plot(timespan, error);
title('Error');
xlabel('time (sec)');
ylabel('error');



