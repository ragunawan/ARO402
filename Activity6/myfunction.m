function newX = myfunction(x)
N = length(x) -1 ;
t = (1:(N+1))';
A = zeros(4*N);
b = zeros(4*N,1);

T = [t.^3, t.^2, t, ones(N+1,1)];

for k = 1:N
    A((2*k-1),4*(k-1)+1:4*k) = T(k,:);
    A((2*k),4*(k-1)+1:4*k) = T(k+1,:);
    b(2*k-1) = x(k);
    b(2*k) = x(k+1);
end

disp(b);
disp(A);
x = b\A;
disp(x);


newX = [];


% create a new T vector
