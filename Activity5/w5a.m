clc
clear

load data;
t=split_data(:,1)-2004; % Time (years)
b=split_data(:,2);      % Sunspot count

figure(1);
plot(t,b,'.','color','c');
hold on;
title('International Sunspot Count: Last 13 years');
xlabel('Time (Years)');
ylabel('Sunspot Count');

% using same color, different intensity to plot
%baseColour = rgb2hsv([1,1,1]); %// Get the HSV values for pure red, but choose any colour
%hue = baseColour(1);
%saturation = baseColour(2);

A=ones(size(b));
err_o=10^10;
k = 25;
for n=1:10
    A=[A, t.^n];
    n                                           % display iteration
    tic                                         % start stopwatch timer
%   x=(transpose(A)*A)^(-1)*transpose(A)*b;     % Least-Squares formula
    x=A\b;                                      % Backdivision operator
    toc                                         % stop stopwatch timer
    Est=A*x;
    residual=abs(Est-b);
    err=sum(residual);

    if ((err_o-err)/err)<0.00001
        break
    end

    err_o=err;
    figure(2)
%   plot(residual,'color',hsv2rgb([hue, saturation, 1-(n-1)/(k-1)]))
    plot(residual,'color', rand(1,3));
    legendInfo{n} = ['Polynomial Order ' num2str(n)]; 
    hold on
end

title('Residual Error of Polynomial Function Estimation');
xlabel('Time (Years)');
ylabel('Resdiual Error');
legend(legendInfo);
hold off;
figure(1);
plot(t,Est,'color','k');
legend('Measured Data','Polynomial Function Estimation');
hold off;