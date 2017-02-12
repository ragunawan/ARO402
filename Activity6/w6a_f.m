function [ out ] = w6a_f( in )
% assuming function has ten data points

x = in; 
x = rand(10,1);
n=length(in);
 
A=zeros(n-1,n-1);
t=1:n;
 
j=1:2;
k=1:4;
 
for i=1:n-1
    A(j,k)=[t(i)^3 t(i)^2 t(i) 1; t(i+1)^3 t(i+1)^2 t(i+1) 1];
    j=j+2;
    k=k+4;
end
 
j=2*n-1;
k=1:8;
 
for i=1:n-2
    A(j,k)=[3*t(i+1)^2 2*t(i+1) 1 0 -3*t(i+1)^2 -2*t(i+1) -1 0];
    j=j+1;
    k=k+4;
end
 
j=3*n-3;
k=1:8;
 
for i=1:n-2
    A(j,k)=[6*t(i+1) 2 0 0 -6*t(i+1) -2 0 0];
    j=j+1;
    k=k+4;
end
 
A(n*4-5,1)=1;
A(n*4-4,n*4-7)=1;
 
j=1:2;
B=zeros(4*n-4,1);
 
for i=1:n-1
    B(j,1)=[x(i); x(i+1)];
    j=j+2;
end
 
X=A\B;
 
t=1:0.01:n;
n=length(t);
 
j=1:2;
k=1:4;
 
for i=1:n-1
    A_i(j,k)=[t(i)^3 t(i)^2 t(i) 1; t(i+1)^3 t(i+1)^2 t(i+1) 1];
    j=j+2;
    k=k+4;
end
 
j=2*n-1;
k=1:8;
 
for i=1:n-2
    A_i(j,k)=[3*t(i+1)^2 2*t(i+1) 1 0 -3*t(i+1)^2 -2*t(i+1) -1 0];
    j=j+1;
    k=k+4;
end
 
j=3*n-3;
k=1:8;
 
for i=1:n-2
    A_i(j,k)=[6*t(i+1) 2 0 0 -6*t(i+1) -2 0 0];
    j=j+1;
    k=k+4;
end

j=4*n-5;
k=1:4;

for i=1:99
    A_i(j,k)=[1 0 0 0];
    k=k+4;
end

j=4*n-4;
k=4*n-7:4*n-4;

for i=1:101;
    A_i(j,k)=[1 0 0 0];
    k=k-4;
end

x1=X(1:4,:);
x2=X(5:8,:);
x3=X(9:12,:);
x4=X(13:16,:);
x5=X(17:20,:);
x6=X(21:24,:);
x7=X(25:28,:);
x8=X(29:32,:);
x9=X(33:36,:);

X_new=repmat([x1 x2 x3 x4 x5 x6 x7 x8 x9],100,1);
est_func=A_i*X_new(:);
for i=1:n;
    out(i)=est_func(2*i-1);
end

figure(1)
plot(1:10,x)
hold on
plot(t,out,'r')
hold off

end

