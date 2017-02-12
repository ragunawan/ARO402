%% Problem 4.4
%   The Maclaurin series expansion for the arctangent of x is defined for
%   |x| <= 1 as 
%           arctan(x) = sigma_(n=0 -> inf) [ ((-1)^n)/(2n+1)*x^(2n+1) ]
%
%       a) Write out the first four terms (n = 0, ... , 3)
%       b) Starting with the simplest version, arctan x = x, add terms one
%       at a time to estimate arctan(pi/6). After each new term is added,
%       compute the true and approximate percent relative errors., Use your
%       calculator to determine the true value. Add terms until the
%       absolute value of the approximate error estimate falls below an
%       error critoerion conforming to two significant figures.

%% Part A
% 0: x
% 1: (-1/3)x^3
% 2: (-1/5)x^5
% 3: (-1/7)x^7

%% Part B
x = pi/6;

counter = 0
cur_val = x

counter = 1
prev_val = cur_val;

iter_val = (((-1)^counter)/(2*counter+1))*x^(2*counter+1)
cur_val = cur_val + iter_val

true_error = cur_val - prev_val
rel_error = true_error/cur_val * 100

while (abs(rel_error) > 0.1)
    counter = counter + 1
    prev_val = cur_val;
    iter_val = (((-1)^counter)/(2*counter+1))*x^(2*counter+1)
    cur_val = cur_val + iter_val
    
    true_error = cur_val - prev_val
    rel_error = true_error/cur_val
end