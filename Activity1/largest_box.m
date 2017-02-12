function [ box_size ] = largest_box( room_map )
%% ARO402-01
% Written by Ryan Gunawan, Nigam Dudhat, Talah Qasim
% Team 2
%% Problem Summary:
%   You are given a matrix that contains only ones and zeros. Think of the
%   ones as columns in an otherwise empty floor plan. You want to fit a big
%   square into the empty space (denoted by zeros). What is the largest
%   empty square sub-matrix you can find in the given matrix?
%% 
room_map

% determine the limits of the room
[row_limit, col_limit] = size(room_map);

% determine largest box possible from dimensions
if row_limit > col_limit
    maxBox = col_limit;
else
    maxBox = row_limit;
end

%% starts with biggest box possible and decreases
for check_size = maxBox:-1:1
    %% loops through to find possible combinations of currentbox
    for left_upper= 1:(row_limit - check_size + 1)
        for left_lower = 1:(col_limit - check_size + 1)
            %% finds right upper and bottom corners for a given box size
            right_upper = left_upper + (check_size -1);
            right_lower = left_lower + (check_size -1);
            %% sums the contents of the box and if there are no obstacles, return size 
            if sum(sum(room_map(left_upper:right_upper, left_lower:right_lower))) == 0
                box_size = check_size;
                return 
            end     
        end
    end
end
% if the entire room is filled, return Not A Number as the box_size
box_size = NaN;
end

