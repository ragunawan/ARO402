function dTdx = hcondprob (~, y)
% heat conduction problem
% y = [T; Z];

T_a = 200;      % K
h = 0.05;       % Heat Transfer Coef. 1/m^2

% Heat Transfer Equation
dTdx = [ y(2) ; ...
          -h*(T_a - y(1))];