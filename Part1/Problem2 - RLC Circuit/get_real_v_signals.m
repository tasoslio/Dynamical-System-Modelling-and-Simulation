%% 1st Assignment of Dynamic System Modeling and Simulation Problem 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function [vc_real, vr_real] = get_real_v_signals()

step = 0.00001;
time = 0 : step : 8;
% Initialize the output of the function
vr_real = zeros(length(time),1);
vc_real = zeros(length(time),1);

% Get real values of vc, vr
for i =  1 : length(time)
    [vr_real(i), vc_real(i)] = v(time(i));
end

% Transpose the dimensions in order to be correct
vc_real = vc_real';
vr_real = vr_real';

end