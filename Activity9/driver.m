clc
clear

T_0 = 300;  % Initial T at 0 in K
T_L = 400;  % T at 10 m in K
L = 10;     % meters

z1 = -5;    % K/m  (initial guess)
z2 = -20;   % K/m  (second initial guess)

% solve IVP with my initial guess for z_0
[~, y] = ode45(@hcondprob,[0, L], [300, z1]);
T1 = y(end, 1);
disp('first solution')
disp(T1)


% solve IVP with my second guess for z_0
[~, y] = ode45(@hcondprob,[0, L], [300, z2]);
T2 = y(end, 1);
disp('second solution')
disp(T2)

z_0 = z1+(z2-z1)/(T2-T1)*(T_L-T1);
disp('final soltion for z_0')
disp(z_0)

[x,y] = ode45(@hcondprob, [0, L], [300, z_0]);
plot(x,y(:,1));
