%q6_14

x = linspace(-1,7);
y = q6_14f(x);
plot(x,y);
grid minor;
title('f(x)=x^5 -16.05x^4 + 88.75x^3 - 192.0375x^2 + 116.35x + 31.6875');

%% Part A: Newton-Raphson Method
% x0 = 0.5825;
% err = 0.01;
% 
% iter = 1
% q6_14f(x0)
% q6_14f_derived(x0)
% x1 = x0 - (q6_14f(x0)/q6_14f_derived(x0))
% 
% q6_14f(x1)
% q6_14f_derived(x1)
% x2 = x1 - (q6_14f(x1)/q6_14f_derived(x1))
% 
% q6_14f(x2)
% q6_14f_derived(x2)
% x3 = x2 - (q6_14f(x2)/q6_14f_derived(x2))

%% Part B: Modified Secant Method
iter = 1
x0 = 0.5825;
del = 0.05;
es = 0.01;

xr = x0 - ((del*x0*q6_14f(x0))/(q6_14f(x0+del*x0)-q6_14f(x0)))

xrstored = [xr 0 0 0];

while (1)
  iter = iter + 1
  xrold = xr;
  xr = xrold - ((del*xrold*q6_14f(xrold))/(q6_14f(xrold+del*xrold)-q6_14f(xrold)))
%  xrstored[iter] = xr;
  
  xrstored(iter) = xr;
  
  ea = abs((xr - xrold)/xr) * 100;  
  if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
  if ea <= es, break, end
  
end

xrstored