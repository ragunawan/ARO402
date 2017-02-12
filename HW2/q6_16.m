%function f(x) = tanh(x2 ? 9) 

q6_16f(3.2)

newtraph(@q6_16f,@q6_16f_derived,3.2)


x = linspace(0,10);
y = q6_16f(x);

plot(x,y);
grid minor;
title('f(x) = tanh(x^2-9)')

