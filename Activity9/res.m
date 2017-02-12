function r = res(z0)

T_0 = 300;  % Initial T at 0 in K
T_L = 400;  % T at 10 m in K
L = 10;     % meters

[~, y] = ode45(@hcondradprob,[0, L], [T_0, z0]);
r = y(end,1) - T_L;