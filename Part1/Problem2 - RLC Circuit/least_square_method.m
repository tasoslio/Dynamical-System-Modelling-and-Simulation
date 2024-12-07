%% 1st Assignment of Dynamic System Modeling and Simulation Problem 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function [theta, vc_hat] = least_square_method(y1)
    
    step = 0.00001;
    time = 0 : step : 8;
    
    % Trying filters for the proper one
    syms s
    flt = expand((s+100)^2);
    
    lamda = [1 200 10000];
    % Create the filters
    g1 = tf([-1 0], lamda);
    g2 = tf([0 -1], lamda);
    g3 = tf([1 0], lamda);
    g4 = tf([0 1], lamda);
    g5 = tf([1 0], lamda);
    g6 = tf([0 1], lamda);
    
    % Laplace Transform
    phi1 = lsim(g1, y1, time);
    phi2 = lsim(g2, y1, time);
    phi3 = lsim(g3, u1_func(time), time);
    phi4 = lsim(g4, u1_func(time), time);
    phi5 = lsim(g5, u2_func(time), time);
    phi6 = lsim(g6, u2_func(time), time);
    
    % Compute phi vector
    phi = [phi1 phi2 phi3 phi4 phi5 phi6];
    
    % Compute theta vector
    theta = y1' * phi * inv((phi' * phi));
    
    vc_hat = phi * theta';
    

    
end