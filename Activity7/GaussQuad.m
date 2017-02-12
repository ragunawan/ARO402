function [ out ] = GaussQuad( f, a, b, n )

%user_input = 5;
user_input = n;
%user_func = @(x) sin(x);
user_func = f;
%user_a = 0;
user_a = a;
%user_b = pi/2;
user_b = b;

% step 1
if(user_input == 2)
% n = 2
    c1 = 1;
    c2 = 1;
    c_i = [c1 c2];
    
    x1 = -0.57735027;
    x2 =  0.57735027;
    x_is = [x1 x2];
elseif (user_input == 3)
% n = 3
    c1 = 0.5555556;
    c2 = 0.8888889;
    c3 = 0.5555556;
    c_i = [c1 c2 c3];
    
    x1 = -0.77459667;
    x2 = 0;
    x3 =  0.77459667;
    x_is = [x1 x2 x3];
    
elseif (user_input == 4)
% n = 4
    c1 = 0.3478548;
    c2 = 0.6521452;
    c3 = 0.6521452;
    c4 = 0.34708548;
    c_is = [c1 c2 c3 c4];
    
    x1 = -0.86113631;
    x2 = -0.33998104;
    x3 = 0.33998104;
    x4 = 0.86113631;
    x_is = [x1 x2 x3 x4];
elseif (user_input == 5)
% n = 5
    c1 = 0.2369269;
    c2 = 0.4786287;
    c3 = 0.5688889;
    c4 = 0.4786287;
    c5 = 0.2369269;
    c_i = [c1 c2 c3 c4 c5];
    
    x1 = -0.90617985;
    x2 = -0.53846931;
    x3 = 0;
    x4 = 0.53846931;
    x5 = 0.90617985;
    x_is = [x1 x2 x3 x4 x5];
elseif (user_input == 6)
% n = 6
    c1 = 0.1713245;
    c2 = 0.3607616;
    c3 = 0.4679139;
    c4 = 0.4679139;
    c5 = 0.3607616;
    c6 = 0.1713245;
    c_i = [c1 c2 c3 c4 c5 c6];
    
    x1 = -0.93246954;
    x2 = -0.66120938;
    x3 = -0.23861919;
    x4 = 0.23861919;
    x5 = 0.66120938;
    x6 = 0.93246951;
    x_is = [x1 x2 x3 x4 x5 x6];
end
%% function evaluation
x = @(x_s) ((user_b + user_a )/2)+((user_b-user_a)/2)*x_s;


out = 0;

for inter = 1:user_input
    % step 1.a
    x_i(inter) = x(x_is(inter));
    
    % step 2

    eval_func(inter) = user_func(x_i(inter));
    
    % step 2.a
    e_func_dx(inter) = eval_func(inter)*(user_b-user_a)/2;
    
    x_is(inter) = (x_i(inter) - (user_b+user_a)/2)*(2/(user_b-user_a));  
    g_func = @(x_is) (user_b-user_a)/2*user_func((user_b+user_a)/2+(user_b-user_a)/2*x_is);
    g_ev_func(inter) = g_func(x_is(inter));
    
    % step 3
    out = out + c_i(inter)*e_func_dx(inter);
    
end

end

