%% 1st Assignment of Dynamic System Modeling and Simulation Problem 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function dx = dynamics_func(time, y, mass, b_damp, k_spring)
    
    dx(1) = y(2);
    dx2 = -(b_damp / mass) * y(2) - (k_spring / mass) * y(1) + (1 / mass) * u_func(time);
    dx(2) = dx2;
    dx = dx';
    
end