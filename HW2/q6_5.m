%Q6.5

q6_5f(4.52)

x = linspace(0,8);
y = q6_5f(x);

plot(x,y);
grid minor;
title('f(x) = -1 + 5.5*x - 4*x^2 + 0.5*x^3');

%%
newtraph(@q6_5f,@q6_5f_derivative,4.54);
