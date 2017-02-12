
%% Boundary Conditions
T_green = 20;
T_yellow = 50;
T_red = 400;
T_orange = 200;

%%
n = 12;             % temporary placeholder to make calcs reasonable

m_zero = zeros(n);  % zero matrix
m_id = eye(n);      % identity matrix
b = zeros(n,1);     % need to figure out boundary condition pattern
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
big_matrix = zeros(n*n);

for c_xf = 1:n
    for c_yf = 1:n
       
        if(c_xf == c_yf)
            big_matrix{c_xf,c_yf} = s_matrix;
        elseif(c_xf-1 == c_yf || c_xf+1 == c_yf)
            big_matrix{c_xf,c_yf} = m_id;
        else
            big_matrix{c_xf,c_yf} = m_zero;
        end    
        
    end
end

for tread = 1:n
    b = 100;        % temporary placeholder for 'b' matrix
end

%% Answer + Plot Generation
answer = GaussSeidel(big_matrix, b);
contourf(answer);