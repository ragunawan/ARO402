function [ mass_diff ] = q5_20f( h1 )
% 

r1 = 0.5;       % m
r2 = 1;         % m
dr = 0.5;
h = 1;          % m
rho_f = 200;    % frustrum density [kg/m^3]
rho_w = 1000;   % water density [kg/m^3]
r_mid = r1 + dr*h1;

 %   vol = (pi*h)/3*(r1^2 + r2^2 + r1*r2);   
 %   vol_surf = (pi*h1)/3*(r1^2 + (r_mid)^2 + r1*r_mid);
    vol_frus = (pi*h)/3*(r1^2 + r2^2 + r1*r2);
    mass_frus = vol_frus * rho_f;
 
    vol_sub = (pi*h1)/3*(r_mid^2 + (r2)^2 + r_mid*r2);
    mass_h2o = vol_sub * rho_w;
    
    mass_diff = mass_frus - mass_h2o;
end

%% notes
% need to guess h1, and compare the mass of water to mass of fulstrucm