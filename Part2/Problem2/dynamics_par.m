%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function dxode = dynamics_par(t, ode_state, alpha, beta, g1, g2, flag_case, n0, f)
    if flag_case == 0
        dxode(1) = -alpha * ode_state(1) + beta * u_func(t); 
        dxode(2) = -g1 * (ode_state(1) - ode_state(4)) * ode_state(4);  
        dxode(3) = g2 * (ode_state(1) - ode_state(4)) * u_func(t);
        dxode(4) = -ode_state(2) * ode_state(4) + ode_state(3) * u_func(t);
        
        dxode = dxode';
        
    elseif flag_case == 1
        dxode(1) = -alpha * ode_state(1) + beta * u_func(t); 
        dxode(2) = -g1 * ((ode_state(1) + noise_func(t, n0, f)) - ode_state(4)) * ode_state(4);  
        dxode(3) = g2 * ((ode_state(1) + noise_func(t, n0, f)) - ode_state(4)) * u_func(t);
        dxode(4) = -ode_state(2) * ode_state(4) + ode_state(3) * u_func(t);
        
        dxode = dxode';
    else 
        fprintf("Wrong Flag Value")
    end
    
end

