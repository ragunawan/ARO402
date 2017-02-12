function [ sizeBox ] = myFunct( room_map )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    room_map
    [r,c] = size(room_map)
    currentSize = 0
    maxSize = 1
    
    for row = 1:r
        for col = 1:c
            % process through the entire matrix as a coordinate system
            
        if room_map(row, col) == 1
            
        
        end
        end
        
    end
            
    
    sizeBox = 1
end

