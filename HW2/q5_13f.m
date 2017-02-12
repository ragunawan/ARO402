function [ vel ] = q5_13f( g, m, c, t )
%FUNC_W33 Summary of this function goes here
%   Detailed explanation goes here
    vel = g*m*(1-exp(-c*t/m))/c;
end

