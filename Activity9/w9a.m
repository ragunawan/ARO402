%% Week 9 Activity
% Nigam Dudhat, Ryan Gunawan, Talah Qasim
% ARO402-01     | Dr. Nakhjiri |    Fall 2016
clc
clear
%%
g = 9.81;      % m/s^2
m = 15;        % kg
v0 = 50;       % m/s
c = 0.2;       % drag coefficient
rho = 1.29;    % density of air, kg/m^3
s = 0.25;      % cross sectional area of projectile, m^2

%% equations of motion function
motiony = @(y,theta,t) v*sin(theta)*t + 1/2*(-D/m-g*sin(theta))*t^2;
%motionx = @(x,theta,t) v*cos(theta)*t + 1/2*(-D/m-g*sin(theta))*t^2;

% function dTdx = hcondradprob (~, y)
% heat conduction problem
% y = [T; Z];

T_a = 200;      % K
h = 0.05;       % Heat Transfer Coef. 1/m^2
sigma = 2.7*10^-9;


% Heat Transfer Equation
% dTdx = [ y(2) ; ...
%               ; ...  
%               ; ... 
% ];

%% Case A: No Wind: w(t) = 0 for all t

% time calculation from launch to landing
theta_0 = pi/36;
D = @(xdot, w, ydot) c*rho*s/2*((xdot - w^2 + ydot^2));
xdot = @(v,theta) v*cos(theta);
ydot = @(v,theta) v*sin(theta);
theta_dot = @(v, theta) -g/v*sin(theta);
vdot = @(D, theta) -D/m-g*sin(theta);


D = c*rho*s/2*((v0*cos(theta_0) + (v0*sin(theta_0))^2));
t = -v0*sin(theta_0)/((1/2)*(-D/m-g*sin(theta_0)))

% no wind
w = 0;
%% Angles Calculations

hold on
figure(1)
for k = 1:17
    k
    theta = k*pi/36;
    D = c*rho*s/2*((v0*cos(theta) + (v0*sin(theta))^2));
    t = -v0*sin(theta)/((1/2)*(-D(xdot(v0, theta), w, ydot(v0, theta))/m-g*sin(theta)))
    plot(x,y);
    
end
hold off
%% Case B: Steady Headwind
