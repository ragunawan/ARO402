
 room_map = [0, 0, 0, 0;
 0, 0, 0, 0;
 0, 0, 1, 0;
 0, 0, 0, 0]


[r,c] = size(room_map);


if r > c
    maxBox = c;
else
    maxBox = r;
end

foundSize = 0;

%row = r;
%col = c;



%if room_map(row, col) ~= 1
   % for examineRow = 1: (r - row)
   % look at the first index and find largest box possible
    
    
 %   for exCol = checksize:1
  %      for exRow = checksize:1
         for chksize = maxBox:1
            valid = true
            for examineCol = 1:chksize
                for examineRow = 1:chksize
                    if (room_map(examineRow, examineCol) == 1)
                        valid = false
                    end
                end
            end

            if valid
                foundSize = chksize
                break
            end
            
  
         end
         

            
  %      end
  %      checksize = checksize - 1;
  %  end
    
    

    
%end

foundSize