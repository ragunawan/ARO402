function dTdx = hcondradprob (~, y)
% heat conduction problem
% y = [T; Z];

T_a = 200;      % K
h = 0.05;       % Heat Transfer Coef. 1/m^2
sigma = 2.7*10^-9;


% Heat Transfer Equation
dTdx = [ y(2) ; ...
          -h*(T_a - y(1))-sigma*(T_a^4 - y(1)^4)];