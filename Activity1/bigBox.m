function sizebox = bigBox( room_map )
% a = [0, 0, 0, 0;
% 0, 0, 0, 0;
% 0, 0, 1, 0;
% 0, 0, 0, 0]


[r,c] = size(room_map);


if r > c
    maxDim = c;
else
    maxDim = r;
end


row = r;
col = c;
room_map(row,col)
valid = true;

%if room_map(row, col) ~= 1
   % for examineRow = 1: (r - row)
   % look at the first index and find largest box possible
    
    
 %   for exCol = checksize:1
  %      for exRow = checksize:1
         for chksize = maxDim:1
            for examineCol = 1:chksize
                for examineRow = 1:chksize
                    if (room_map(examineRow, examineCol) ~= 0)
                        valid = false;
                    end
                end
            end

            if valid
                break
            end
            
            chksize = chksize - 1
         end
         

            
  %      end
  %      checksize = checksize - 1;
  %  end
    
    

    
%end

valid

chksize

end