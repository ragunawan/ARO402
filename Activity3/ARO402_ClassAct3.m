%%Class Activity 3
% Nonlinear Equation: f(x)=e^(-x)-x


%% Bisection Method

% Use Bisection method (need 2 initial guesses), use the line search code
% to eliminate one initial guess and use only Xo=0 as the initial guess.

%Xo=0

%% Newton- Raphson Method

%use newton-raphson method to solve.
clear
clc

%INPUT

xr=0
es=0.0001
maxit=50

[root,ea,iter,xrstored]=newtraph(@my_fun,@dmy_fun,xr)

ea=abs(xrstored-xrstored(end))

plot(ea,'b')
title 'Newton-Raphson Method vs. MATLAB Root Finding Method'
ylabel 'True Percent Relative Error'
xlabel 'Iteration'
hold on

%% IQI Method

%Use inverse quadratic interpolation (needs 3 initial guesses), combine
%bisection method and IQI and use only Xo=0 as the initial guess.

%Xo=0

%% MATLAB Root Finding Method

%use the MATLAB function "fzero" and solve for the root of our equation
%with X0=0


xo=[0,2];

options=optimset ('Display', 'iter');
[xr]=fzero(@my_fun,xo,options)

ea=abs(xr-xr(end))

X=[0, 0.698162, 0.5818,0.567133,0.567143,0.567143,0.567143]
ea=abs(X-X(end))
y=[1,2,3,4,5,6,7]

plot(y,ea)

%% Comparison of Methods

%generate a plot similar to Fig 6.9 that demonstrates true error vs. number
%of iterations for all methods.



