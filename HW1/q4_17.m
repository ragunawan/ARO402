x = 0.1;

%% zero order approximation
order = 0
approx = 1
true_value = 1/(1-x);
true_error = (true_value-approx)/(true_value) * 100
prev_value = approx;

n = 3;
%% first, second and third-order approximation
for order = 1 : n
    order
    approx = approx + x^order
    true_value = 1/(1-x);
    true_error = (true_value-approx)/(true_value) * 100
    approx_error = (true_value - prev_value) / true_value
    
    prev_value = approx;
end