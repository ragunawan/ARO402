function [ val2 ] = w2a( x )
%% Week 2 Activity Part 1
% Nigam Dudhat, Ryan Gunawan, Talah Qasim

% Create a MATLAB function to implement the exponential formula as accurate
% as the machine epsilon for any user-defined value of x. Test your code 
% comparing the value with MATLAB built-in function ?exp?. In each step of 
% your iteration, your code should also compute two forms of errors for 
% your approximation: absolute and relative error. Plot the propogation of
% error from the first step to the last step.

%% Part 1
machine_epsilon = 2^(-53);              % round off error
disp('----------------');

iteration = 1
val1 = 1                                % initial value of e^(0)
val2 =  val1 + x^(1)/(factorial(1))    

% Error calculations
err_abs = val2 - val1
err_rel = err_abs/val2*100

% Plotting the Error Propogation
figure(1)
hold on
title('Relative Error Propogation');
xlabel('Iterations');
ylabel('Relative Error [%]');
scatter(iteration, err_rel);

% recursive loop to continue calculating iterations until meets condition
while (abs(val2 - val1) > machine_epsilon)
    disp('----------------');
    iteration = iteration + 1
    
    val1 = val2
    val2 = val1 + x^(iteration)/(factorial(iteration))
        
    err_abs = val2 - val1
    err_rel = err_abs/val2*100
    
    scatter(iteration, err_rel);
    
end
disp('----------------');
hold off
saveas(figure(1),'W2ARelativeError.jpg')
end