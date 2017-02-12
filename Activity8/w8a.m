w = 1;
j = 0.5;
x = [0;-5];
h = 0.01;            % timestep
A = [   0,      1 ; 
     -w^2, -2*w*j];
y_old = x;
y_new = x;
iter = 0;

% Euler's Method
figure(1)
hold on
for t = 0:h:5
    iter = iter + 1;
    y_old = y_new;           % y_old

    f = A*y_old;         % f(y_old, t_old)

    y_new = y_old + f*h;    % y_old + f  
    
    plot(iter,y_new);
    
end
hold off

% Modified Euler's Method
y_old = x;
y_new = x;
iter = 0;


figure(2)
hold on
for t = 0:h:5
    iter = iter + 1;
    y_old = y_new;           % y_old

    f = A*y_old;             % f(y_old, t_old)
    
    y_temp = y_old + f*h;     % y_old + f
    f_temp = A*y_temp;
    
    y_new = y_old + ((f + f_temp)/2)*h
    
    plot(iter, y_new);
    
end
hold off

% RK4
y_old = x;
y_new = x;
iter = 0;


figure(3)
hold on
for t = 0:h:5
    iter = iter + 1;
    y_old = y_new;           % y_old

    f = A*y_old;             % f(y_old, t_old)
    
    y_temp = y_old + f*h;     % y_old + f
    f_temp = A*y_temp;
    
    y_new = y_old + ((f + f_temp)/2)*h
    
    plot(iter, y_new);
    
end
hold off