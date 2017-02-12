%% Problem 4.12

g = 9.81;
t = 6;
c = 12.5;
e_c = 1.5;
m = 50;
e_m = 2;

%% calculations
velocity = (g*m/c)*(1-exp(-(c/m)*t))

dv_m = abs((g/c)*(1-exp(-c/m*t))-g*t/m*(exp(-c/m*t)))
error_m = dv_m * e_m

dv_c = abs((-g*m/(c^2))*(1-exp(-c/m*t))+g*t/c*(exp(-c/m*t)))
error_c = dv_c * e_c

error_total = error_m + error_c