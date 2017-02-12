function dzdt = EOM(t, z)
%% Initial Contion passed from Z change-space of Equations of Motion
% Format:
%     z = [0;       % X
%          0;       % Y
%          theta;   % Theta
%          v0];     % Velocity

%% Constant Variables
% gravity:
    g = 9.81;      % m/s^2
% mass of projectile:
    m = 15;        % kg
% drag coefficient of object:
    c = 0.2;       % unitless
% density of air:
    rho = 1.29;    % kg/m^3
% cross-sectional area of projectile (spherical)
    s = 0.25;      % m^2
    
%% Implemented Switch-Case structure to optimize ODE45 passing for four different cases
    switch(4)
        case 1
            %% Case (A): No Wind Condition
% Drag of projectile at each time instance
            D = c*rho*s/2*( (z(4)*cos(z(3)) - 0)^2 + ( z(4)*sin(z(3)) )^2 );
% Equations of motion change for each time instance            
            dzdt = [ z(4)*cos(z(3));
                 z(4)*sin(z(3));
                 -g/z(4)*cos(z(3));
                 -D/m-g*sin(z(3))];
        case 2
            %% Case (B): Steady Headwind Condition
% Drag of projectile at each time instance            
            D = c*rho*s/2*( (z(4)*cos(z(3)) + 10)^2 + ( z(4)*sin(z(3)) )^2 );
% Equations of motion change for each time instance    
            dzdt = [ z(4)*cos(z(3));
                 z(4)*sin(z(3));
                 -g/z(4)*cos(z(3));
                 -D/m-g*sin(z(3))];
        case 3
            %% Case (C): Intermitten Tailwind Condition
% Drag of projectile at each time instance            
            % Changes the drag variable based on the time variable
            if (mod(floor(t),2) == 0)
                D = c*rho*s/2*( (z(4)*cos(z(3)) - 10)^2 + ( z(4)*sin(z(3)) )^2 );
            else
                D = c*rho*s/2*( (z(4)*cos(z(3)) - 0)^2 + ( z(4)*sin(z(3)) )^2 );
            end
% Equations of motion change for each time instance                
            dzdt = [ z(4)*cos(z(3));
                 z(4)*sin(z(3));
                 -g/z(4)*cos(z(3));
                 -D/m-g*sin(z(3))];  
        case 4
% Drag of projectile at each time instance            
            % Couldn't figure out what was wrong with this function
            %   seemed to hang for an unusually large amount of time
            D = c*rho*s/2*( (z(4)*cos(z(3)) - 10*randn)^2 + ( z(4)*sin(z(3)) )^2 );
% Equations of motion change for each time instance    
            dzdt = [ z(4)*cos(z(3));
                 z(4)*sin(z(3));
                 -g/z(4)*cos(z(3));
                 -D/m-g*sin(z(3))];
        otherwise
            % catch-all case
            disp('error');
    end   
end