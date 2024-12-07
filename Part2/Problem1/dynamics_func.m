%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function dxode = dynamics_func(t, ode_state, alpha, beta, am, gamma, flag_case)
%   x = ode_state(1)
%   phi1 = ode_state(2)
%   phi2 = ode_state(3)
%   theta1_hat = ode_state(4)
%   theta2_hat = ode_state(5)
    
    dxode(1) = -alpha * ode_state(1) + beta * u_func(t, flag_case); 
    dxode(2) = -am * ode_state(2) + ode_state(1); 
    dxode(3) = -am * ode_state(3) + u_func(t, flag_case); 
    dxode(4) = gamma * (ode_state(1) - (ode_state(4) * ode_state(2) + ode_state(5) * ode_state(3))) * ode_state(2); 
    dxode(5) = gamma * (ode_state(1) - [ode_state(4), ode_state(5)] * [ode_state(2); ode_state(3)]) * ode_state(3); 
    
    dxode = dxode';
end