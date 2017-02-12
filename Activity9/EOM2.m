function dzdt = EOM2(t, z)
%     z = [0;
%          0;
%          theta;
%          v0];

%% Initial Conditions
    g = 9.81;      % m/s^2
    m = 15;        % kg
    v0 = 50;       % m/s
    c = 0.2;       % drag coefficient
    rho = 1.29;    % density of air, kg/m^3
    s = 0.25;      % cross sectional area of projectile, m^2

    D = c*rho*s/2*( z(4)*cos(z(3)) + 10^2 + ( z(4)*sin(z(3)) )^2 );
 
    dzdt = [ z(4)*cos(z(3));
         z(4)*sin(z(3));
         -g/z(4)*cos(z(3));
         -D/m-g*sin(z(3))];

          
end