%% 5.22 Pseudocoding

% Function Bisect(xl, xu, es, imax, xr, iter, ea)
%     iter = 0
%     fl = f(xl)                      % *
%     
%     DO
%         xrold = xr
%         xr = (xl+xu)/2
%         
%         fr = f(xr)                  % *
%         iter = iter + 1
%         if xr ~= 0 then
%             ea = abs((xr-xrold) / xr) * 100
%         end 
%         
%         test = fl * fr              % *
%         if (test < 0 )
%             xu = xr
%         elseif (test > 0)
%             xl = xr
%             
%             fl = fr                 % * 
%         else
%             ea = 0
%         end
%         if ea < es OR iter >= imax
%             exit
%         end
%    END DO
%    bisect = xr
% END Bisect

% function: f(x) = x^10 - 1

q5_22f(0, 1.3)