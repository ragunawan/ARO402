clear

% parameters
g = 9.81;    % m/s^2
c = 15;      % kg/s
t = 10;      % seconds
v = 36;      % m/s (target velocity)


%% first iteration
% initial guesses
iter = 1
xl = 10
f_xl = q5_13f(g, xl, c, t) - v

xu = 100
f_xu = q5_13f(g, xu, c, t) - v

xr = xu - (f_xu*(xl-xu)/(f_xl - f_xu))
f_xr = q5_13f(g, xr, c, t) - v

error_percent = f_xr / 36 * 100 

%% further iterations

while (f_xr / v > 0.001)
    iter = iter + 1
    
    if (f_xr > 0)
        xu = xr
        f_xu = q5_13f(g, xu, c, t) - v
    else
        xl = xr
        f_xl = q5_13f(g, xl, c, t) - v
    end
    
    
    xr = xu - (f_xu*(xl-xu)/(f_xl - f_xu))
    f_xr = q5_13f(g, xr, c, t) - v
    error_percent = f_xr / v * 100
   
end
