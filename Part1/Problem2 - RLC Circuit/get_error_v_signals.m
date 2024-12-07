%% 1st Assignment of Dynamic System Modeling and Simulation Problem 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171

function [vc_error, vr_error] = get_error_v_signals()

step = 0.00001;
time = 0 : step : 8;
% Initialize the output of the function
vr_error = zeros(length(time),1);
vc_error = zeros(length(time),1);

% Get real values of vc, vr
for i =  1 : length(time)
    [vr_error(i), vc_error(i)] = v(time(i));
end

% Generate  random values between 500 1500 with randi(l) function

for k = 1 : 3 
     vc_error(randi(length(time))) = (2000 - 500) * rand() + 500;
     vr_error(randi(length(time))) = (2000 - 500) * rand() + 500;
 end

% Transpose the dimensions in order to be correct
vc_error = vc_error';
vr_error = vr_error';

end