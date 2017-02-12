%% Boundary Conditions
T_green = 20;
T_yellow = 50;
T_red = 400;
T_orange = 200;

%%
n = 12;             % temporary placeholder to make calcs reasonable

m_zero = zeros(n);  % zero matrix
m_id = eye(n);      % identity matrix
b = zeros(n*n,1);     % need to figure out boundary condition pattern
% b = [20; 50; 400; 200; 20; 50; 400; 200; 876];
s_matrix = zeros(n);

for c_x = 1:n
    for c_y = 1:n
        if(c_x == c_y)
            s_matrix(c_x,c_y) = -4;
            
            if(c_x ~= 1 && c_x ~= n)
                s_matrix(c_x-1,c_y) = 1;
                s_matrix(c_x+1,c_y) = 1;
            elseif (c_x == 1)
                s_matrix(c_x+1,c_y) = 1;
            elseif (c_x == n)
                s_matrix(c_x-1,c_y) = 1;
            end
        end
    end
end

%% A ('nxn' x 'nxn') matrix
second_matrix = zeros(n*n);

for alpha = 1:n:n*n
%   unique matrix on diagonal
    second_matrix(alpha:alpha+n-1, alpha:alpha+n-1) = s_matrix;
end

for alpha = 1:n:n*n-n
%   identity matrix
    second_matrix(alpha:alpha+n-1, alpha+n:alpha+2*n-1) = m_id;
    second_matrix(alpha+n:alpha+2*n-1, alpha:alpha+n-1) = m_id;
end

for temp = 1:n*n
    if (temp == 1)
        b(temp) = T_green+T_red;
    elseif (temp > 1 && temp < n)
        b(temp) = T_green;
    elseif (temp == n)
        b(temp) = T_green+T_yellow;
    elseif (temp == n*n-n)
        b(temp) = T_red+T_orange;
    elseif (temp == n*n)
        b(temp) = T_orange+T_yellow;
    elseif (mod(temp, n) == 1)
        b(temp) = T_red;
    elseif (mod(temp, n) == 0)
        b(temp) = T_yellow;    
    end
end


%% Answer + Plot Generation
bloop = GaussSeidel(second_matrix, b);
figure(1);
title('Two Dimensional Heat Distribution Problem')

contourf(reshape(bloop, n,n));