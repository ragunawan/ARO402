function simpleIQI(f,xr)
a = xr(1);
b = xr(2);
c = xr(3);
k = 0;
fprintf('iter = %d, x_%d = %d\n',k,k,a)
while abs(c-b) > eps*abs(c)
    p = polyfit([f(a),f(b),f(c)],[a,b,c],2);
    x = polyval(p,0);
    a = b;
    b = c;
    c = x;
    k = k + 1;
    fprintf('iter = %d, x_%d = %d\n',k,k,x)
end