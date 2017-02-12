j1_m = 70;      % kg
j1_cD = 12;     % kg/s
j1_t = 9;       % s

j2_m = 80;      % kg
j2_cD = 15;     % kg/s
syms x;

g = 9.81;       % m/s^2

v1 = ((g*j1_m)/(j1_cD))*(1-exp(-(j1_cD/j1_m)*j1_t))     % m/s

ans = -1*log(-1*(v1*(j2_cD/(g*j2_m)) - 1))*(j2_m/j2_cD)

