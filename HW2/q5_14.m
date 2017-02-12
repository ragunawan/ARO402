
%% initial parameters
%m = 82      % kg
%v = 36      % m/s
%t = 4       % seconds
%g = 9.81    % m/s^2

% initial guesses
xl = 3;
xu = 5;

init_velxr = q5_13f(9.81, 82, 4, 4)

%%
%q5_14f(g, m, c, t)
xr = bisect(@q5_14f, xl, xu, 2)

rel_error = q5_14f(xr)

velocity = q5_13f(9.81, 82, xr, 4)