%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 3
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function lyap_system = lyapunov_method(t, ode_state, a11, a12, a21, a22, b1, b2, g1, g2)

    lyap_system(1) = a11 * ode_state(1) + a12 * ode_state(2) + b1 * u_func(t);
    lyap_system(2) = a21 * ode_state(1) + a22 * ode_state(2) + b2 * u_func(t);
    lyap_system(3) = ode_state(5) * ode_state(3) + ode_state(6) * ode_state(4) + ode_state(9) * u_func(t);
    lyap_system(4) = ode_state(7) * ode_state(3) + ode_state(8) * ode_state(4) + ode_state(10) * u_func(t);
    lyap_system(5) = g1 * ode_state(3) * (ode_state(1) - ode_state(3));
    lyap_system(6) = g1 * ode_state(4) * (ode_state(1) - ode_state(3));
    lyap_system(7) = g1 * ode_state(3) * (ode_state(2) - ode_state(4));
    lyap_system(8) = g1 * ode_state(4) * (ode_state(2) - ode_state(4));
    lyap_system(9) = g2 * u_func(t) * (ode_state(1) - ode_state(3));
    lyap_system(10) = g2 * u_func(t) * (ode_state(2) - ode_state(4));

    lyap_system = lyap_system';
end