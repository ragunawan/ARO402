function [ out ] = q5_22f( xl, xu, es, imax, xr, iter, ea )
if nargin<4||isempty(es), es=0.0001;end
if nargin<5||isempty(imax), imax=50;end
    fun_eval = 0;
    iter = 0; xr = xl; ea = 100;
    
    fl = (xl^10 - 1)                      % *
    fun_eval = fun_eval+1;
    while (ea > es) && (iter <= imax)
        xrold = xr
        xr = (xl+xu)/2
        
        fr = (xr^10 - 1)                  % *
        fun_eval = fun_eval+1;
        
        iter = iter + 1
        if xr ~= 0
            ea = abs((xr-xrold) / xr) * 100
        end 
        
        test = fl * fr              % *
        fun_eval = fun_eval+1;
        
        if (test < 0 )
            xu = xr
        elseif (test > 0)
            xl = xr
            
            fl = fr                 % * 
            fun_eval = fun_eval+1;
        else
            ea = 0
        end
        
    end
    iter
    fun_eval
    out = xr
end

% function: f(x) = x^10 - 1