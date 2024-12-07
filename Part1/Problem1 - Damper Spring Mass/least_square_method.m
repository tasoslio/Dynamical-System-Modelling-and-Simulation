%% 1st Assignment of Dynamic System Modeling and Simulation Problem 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function [mass, b_damp, k_spring, theta, y_hat] = least_square_method(y_real)
    time = 0 : 0.1 : 10;
    y = y_real;
    
    syms s
    % Create the filter 
    filter = expand((s + 1) ^ 2);
    % Vector with the coefficients of the filter
    lamda = [1 2 1];
    
    g1 = tf([-1 0], lamda);
    g2 = tf([0 -1], lamda);
    g3 = tf([0 1], lamda);
    
    % Compute the phi matrix = [phi1 phi2 phi3]
    phi1 = lsim(g1, y, time);
    phi2 = lsim(g2, y, time);
    phi3 = lsim(g3, u_func(time), time);
    
    phi = [phi1 phi2 phi3];
    
    theta = y' * phi * inv((phi' * phi));
    
    mass = 1 / theta(3);
    b_damp = (2 + theta(1)) * mass;
    k_spring = (1 + theta(2)) * mass;
    
    
    y_hat = phi * theta';
    
    
    
    
end