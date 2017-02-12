function [ out ] = w6a_f( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [row,col] = size(input)
    t = input(:, 1);
    b = input(:, 2);
%    fn = a*x^3+b*x^2+c*x+d;
%    A*x = B 

    A = zeros(4*row,4*row)
    
    system_eqs = 2*row;
    
% system of equations    
    for trav_row = 1:2*row
%        for trav_col = 1:4*row
%       if (mod(trav_row,2) == 1)
            A(trav_row+(1*trav_row-1), 1) = t(trav_row,1)^3;
            A(trav_row+(1*trav_row-1), 2) = t(trav_row,1)^2;
            A(trav_row+(1*trav_row-1), 3) = t(trav_row,1);
            A(trav_row+(1*trav_row-1), 4) = 1; 
%        else
            A(trav_row+1, 1) = t(trav_row+1,1)^3;
            A(trav_row+1, 2) = t(trav_row+1,1)^2;
            A(trav_row+1, 3) = t(trav_row+1,1);
            A(trav_row+1, 4) = 1;
%        end
%        end
    end
    
    
    

end

