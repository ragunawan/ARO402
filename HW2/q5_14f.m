function [ out ] = q5_14f( c )
% velocity of a parachutist in free fall

% g: acceleration due to gravity [m/s^2]
% m: mass of parachutist [kg]
% c: drag coefficient [kg/s]
% t: time of freefall
g = 9.81;
m = 82;
v = 36;
t = 4;

    out = g*m*(1-exp(-c*t/m))/c - v;
end

