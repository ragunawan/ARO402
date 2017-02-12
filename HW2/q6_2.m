

%% a. graphically
x = linspace(0,5);
y = 2*x.^3 - 11.7*x.^2 + 17.7*x - 5;

plot(x,y);
grid minor;
title('y = 2*x^3 - 11.7*x^2 + 17.7*x - 5');
xlabel('x-axis');
ylabel('y-axis');

%% b. Fixed-Point Iteration
% three iterations, x_0 = 3

x_0 = 3;
