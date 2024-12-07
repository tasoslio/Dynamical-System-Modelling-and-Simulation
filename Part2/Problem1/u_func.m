%% 2nd Assignment of Dynamic System Modeling and Simulation Problem 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
function u = u_func(t, flag_case)

    if flag_case == 0
        u = 3;
    elseif flag_case == 1
        u = 3*cos(2*t);
    else 
        fprintf("Wrong Flag");
    end
        
end