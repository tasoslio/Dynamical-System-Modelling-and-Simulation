%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function noise = noise_func(t, n0, f)

    noise = n0 * sin(2 * pi * f * t);

end
