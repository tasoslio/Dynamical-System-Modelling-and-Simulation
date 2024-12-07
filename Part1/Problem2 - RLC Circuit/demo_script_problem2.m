%% 1st Assignment of Dynamic System Modeling and Simulation Problem 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

step = 0.00001;
time = 0 : step : 8;

% Get real values of v
[vc_real, vr_real] = get_real_v_signals();

[theta, vc_hat] = least_square_method(vc_real');


% Compute vr
vr_hat = u1_func(time) + u2_func(time) - vc_hat;


% Do the same like above for big incorrect values vc and vr + ls
[vc_error, vr_error] = get_error_v_signals();

[theta_error, vc_hat_error] = least_square_method(vc_error');

vr_hat_error = u1_func(time) + u2_func(time) - vc_hat_error;

% Plots for the real ones
figure(1);
plot(time, vc_real);
title('Vc Real Values');
ylabel('y1');
xlabel('Time (sec)');

figure(2);
plot(time, vc_hat);
title('Vc Estimation of Model Real Values');
ylabel('y1');
xlabel('Time (sec)');

ec_real = vc_real' - vc_hat;

figure(3);
plot(time, ec_real);
title('Error Real Values');
ylabel('Error Real Vc');
xlabel('Time (sec)');

figure(4);
plot(time, vr_real);
title('Vr Real Values');
ylabel('y2');
xlabel('Time (sec)');

figure(5);
plot(time, vr_hat);
title('Vr Estimation of Model Real Value');
ylabel('y2');
xlabel('Time (sec)');

er_real = vr_real' - vr_hat;

figure(6);
plot(time, er_real);
title('Error Real Values');
ylabel('Error Real Vr');
xlabel('Time (sec)');


% Plots for the error ones
figure(7);
plot(time, vc_error);
title('Vc Error Values');
ylabel('y1');
xlabel('Time (sec)');

figure(8);
plot(time, vc_hat_error);
title('Vc Estimation of Model Error Values');
ylabel('y1');
xlabel('Time (sec)');

ec_error = vc_error' - vc_hat_error;

figure(9);
plot(time, ec_error);
title('Error Error Values');
ylabel('Error Error Vc');
xlabel('Time (sec)');

figure(10);
plot(time, vr_error);
title('Vr Error Values');
ylabel('y2');
xlabel('Time (sec)');

figure(11);
plot(time, vr_hat_error);
title('Vr Estimation of Model Error Value');
ylabel('y2');
xlabel('Time (sec)');

er_error = vr_error' - vr_hat_error;

figure(12);
plot(time, er_error);
title('Error Error Values');
ylabel('Error Error Vr');
xlabel('Time (sec)');
