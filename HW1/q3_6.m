%% Problem 3.6
format long;


%% Variable Declarations
n = 20;
x = 5;
true_val = exp(-5);
val1 = 1;
val2_d = 1;


for iteration = 1:1:n
    iteration
    
    %% Method 1
    if (mod(iteration,2) == 0)
        val1 = val1 + x^(iteration)/(factorial(iteration))
    else
        val1 = val1 - x^(iteration)/(factorial(iteration))
    end
    
    true_error_1 = true_val - val1
    rel_error_1 = true_error_1 / true_val * 100
    
    %% Method 2
    val2_d = val2_d + x^(iteration)/(factorial(iteration)); % denominator
    val2 = 1/(val2_d)
    
    true_error_2 = true_val - val2
    rel_error_2 = true_error_2 / true_val * 100    
    
end

