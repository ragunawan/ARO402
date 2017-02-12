clc
clear

load data
x=split_data(:,1)-2004;
y=split_data(:,2);

figure(1)
plot(x,y,'.','color','c')

hold on
title('International Sunspot Numbers: Last 13 years and forecasts')
xlabel('Time (Years)')
ylabel('Sunspot Counts')




A=[ones(size(x))];
n = 1;
%err_old=10^10;

A=[A, x.^n];
tic
C=(transpose(A)*A)^(-1)*transpose(A)*y;
%C=A\y;
toc
D=A*C;
e=abs(D-y);
err=sum(e);

err_old=err;
figure(2)
title('Residual Errors of Polynomial Estimation Function')
plot(e,'color',rand(1,3))
xlabel('Time (Years)')
ylabel('Residual Error')
hold on


while (((err_old-err)/err) < 0.00001)
n = n+1;
A=[A, x.^n];
tic
C=(transpose(A)*A)^(-1)*transpose(A)*y;
%C=A\y;
toc
D=A*C;
e=abs(D-y);
err=sum(e);

if ((err_old-err)/err)<0.00001
break
end

err_old=err;
figure(2)
plot(e,'color',rand(1,3))
hold on
end

legend()

hold off
figure(1)
plot(x,D, 'color', 'k')
legend('Measured Data','Polynomial Estimation Function')
hold off