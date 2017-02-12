function [ val2 ] = w2a_matrix( input )
%% Week 2 Activity Part 2
% Nigam Dudhat, Ryan Gunawan, Talah Qasim

% This Taylor series can be used to define matrix exponential. Let X be an 
% n × n real or complex matrix. The exponential of X, denoted by e^X, is 
% the n × n matrix given by the power series: is defined to be the identity
% matrix, I, with the same dimensions as X.

% Modified your code if necessary to be able to calculate the matrix 
% exponentials with the accuracy of machine epsilon. You can test your code
% comparing it with MATLAB built-in function ?expm?.
% Try to come up with an idea to calculate the error for the matrix case 
% that reflect the accuracy of your code at each level.
% When submitting your code, includes two plots for the error propagation.

% input = [36, 80; 10, 47]      % test case
machine_epsilon = 2^(-53);
disp('----------------');
iteration = 1;
val1 = eye(size(input,1));                  % first term = identity matrix
val2 = val1 + 1/(factorial(iteration))*input.^iteration;    % second term

err_abs = sum(sum(val2)) - sum(sum(val1))
err_rel = sum(err_abs/sum(sum(val2)))*100

figure(1)
hold on
title('Relative Error Propogation')
ylabel('Percent Error (%)');
xlabel('Iterations');
scatter(iteration, err_rel);
hold off

figure(2)
hold on
title('Absolute Error Propogation')
scatter(iteration, err_abs);
ylabel('Error');
xlabel('Iterations');
hold off

% recursive loop to continue calculating iterations until meets condition
while (abs(sum(sum(val2)) - sum(sum(val1))) > machine_epsilon)
    disp('----------------');
    iteration = iteration + 1
    abs(sum(sum(val2-val1)));
       
    val1 = val2
    val2 = val1 + (1/(factorial(iteration)))*input^iteration
        
    err_abs = sum(sum(val2 - val1))
    err_rel = sum(err_abs/sum(sum(val2)))*100
    
    figure(1)
    hold on
    scatter(iteration, err_rel);  
    hold off
    
    figure(2)
    hold on
    scatter(iteration, err_abs);
    hold off
end
disp('----------------');
hold off
saveas(figure(1),'W2AMatrixRelativeError.jpg')
saveas(figure(2),'W2AMatrixAbsoluteError.jpg')
end

