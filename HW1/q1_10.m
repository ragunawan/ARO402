%% Q1.10

% For the same storage tank described in Prob. 1.9, suppose that the
% outflow is not constant but rather depends ont he depth. For this case,
% the differential equation for depth can be written as: ...

% use Euler's method to solve for the depth y from t = 0 to 10 d with a
% step size of 0.5 d. The parameter values are A = 1250 m^2, Q=450 m^3/d,
% and alpha = 150. Assume that the initial condition is y = 0.


%% variable declarations

t = 0:0.5:10;   % time (days)
A = 1250;       % Area (m^2)
Q = 450;        % Outflow (m^3/d)
alpha = 150;
y = 0;
%% flow equation

y=3*Q/A*sin(t).^2-((alpha*(1+y)^1.5)/A)

figure;
plot (t,y);
title('Problem 1.7');
xlabel('Time (seconds)');
ylabel('Height (meters)');