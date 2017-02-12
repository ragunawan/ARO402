%% initial parameters
r1 = 0.5;       % m
r2 = 1;         % m
h = 1;          % m
rho_f = 200;    % frustrum density [kg/m^3]
rho_w = 1000;   % water density [kg/m^3]

vol_frus = (pi*h)/3*(r1^2 + r2^2 + r1*r2);

mass_frus = vol_frus * rho_f

q5_20f(0.25)

bisect(@q5_20f, 0, 1)