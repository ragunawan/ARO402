%% Week 9 Activity
% Ryan Gunawan, Nigam Dudhat, Talah Qasim
% ARO402-01     | Dr. Nakhjiri |    Fall 2016
clc
clear

%% Calculations
maxDist = 0;            % variable to keep track of farthest distance
options = odeset('RelTol',10e-9,'AbsTol',10e-9);    % ode45 options

hold on
figure(1)

% To find data pertaining to angles from k = 1 to 17 where theta=k*pi/36
for k = 1:17
    theta = k*pi/36;
%% Using ODE45 to integrate the Equations of Motion for the problem
% The EOM function file is separate from this script file. 
% To find for a different test case, modify the switch variable inside the
%   EOM function file.

    [t, y] = ode45(@EOM, [0, 10], [0;0;theta;50],options);
    y(y(:,2) < 0, :) = [];
    
% Determines the trajectory with the greatest downrange distance and saves
%   to a temporary variable for output
    if (maxDist < y(end,1))
        maxDist  = y(end,1);
        maxData = y(end,:);
        maxTime = t(size(y(:,1)));
        maxK = k;
    end
    
    plot(y(:,1), y(:,2));
end
hold off

%% Outputs the greatest downrage distance trajectory and relavant
%   parameters.
disp('Case (A): No Wind Condition');
disp('Greatest Downrage Distance:');
disp('---------------------------');
disp('Trajectory');
disp(maxK);
disp('Angle');
disp(maxK*pi/36);
disp('Flight Time');
disp(maxTime(1));
disp('Downrange Distance');
disp(maxDist);
disp('Impact Velocity');
disp(maxData(4));