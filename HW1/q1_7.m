% decay rate = -kc
% k = constant [ day^-1 ]

% dc/dt = -kc
% [change in mass] = [decrease by decay]

%% part a -- use euler's method to solve this equation from t = 0 to 1 day
%       with k = 0.175 d^-1. Employ a step size of delta_t = 0.1. The
%       concentration at t = 0 is 100 Bq/L [variable c].

k = 0.175;
c_o = 100 ; % [Bq/L]
c_c = c_o;
x_c = zeros(10);
y_t = zeros(10);
counter = 1;

for t = 0:0.1:1
    
    c_c = c_c - k*c_c*(0.1);
    x_c(counter) = c_c;
    y_t(counter) = t;
    counter = counter + 1;
    
end
c_c
y_a = 100;

x_a = 0:0.1:1;
y_a = y_a - k*y_a*(x_a);


%% part b -- plot 
figure

semilogy(x_a,y_a);
title('Problem 1.7');
xlabel('Time (days)');
ylabel('Concentration (becquerel/liter or Bq/L)');