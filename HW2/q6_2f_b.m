function [ out ] = q6_2f_b( x0, es, imax, iter, ea )
%Fixed-Point Iteration
%   funct = (2*x.^3 - 11.7*x.^2 - 5)/(-17.7);


% if nargin<4||isempty(es), es=0.0001;end
% if nargin<5||isempty(imax), imax=50;end

ea = 100;

xr = x0;
iter = 0;

while ( ea > es && iter <= imax) 
    iter
    xrold = (2*xr.^3 - 11.7*xr.^2 - 5)/(-17.7);
    xr = (2*xrold.^3 - 11.7*xrold.^2 - 5)/(-17.7)

    
    if xr ~= 0
        ea = abs((xr-xrold)/xr)*100
    end
    iter = iter + 1;
end

out = xr;

end