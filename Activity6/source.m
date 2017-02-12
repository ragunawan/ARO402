clear;
clc;
 
x=100*rand(10,1);
n=length(x);
 
A=zeros(n-1,n-1);
t=1:n;
 
j=1:2;
k=1:4;
 
for i=1:n-1
    A_new=[t(i)^3 t(i)^2 t(i) 1; t(i+1)^3 t(i+1)^2 t(i+1) 1];
    A(j,k)=A_new;
    j=j+2;
    k=k+4;
end
 
j=2*n-1;
k=1:8;
 
for i=1:n-2
    A_new=[3*t(i+1)^2 2*t(i+1) 1 0 -3*t(i+1)^2 -2*t(i+1) -1 0];
    A(j,k)=A_new;
    j=j+1;
    k=k+4;
end
 
j=3*n-3;
k=1:8;
 
for i=1:n-2
    A_new=[6*t(i+1) 2 0 0 -6*t(i+1) -2 0 0];
    A(j,k)=A_new;
    j=j+1;
    k=k+4;
end
 
A(n*4-5,1)=1;
A(n*4-4,n*4-7)=1;
 
j=1:2;
B=zeros(4*n-4,1);
 
for i=1:n-1
    B_new=[x(i); x(i+1)];
    B(j,1)=B_new;
    j=j+2;
end
 
X=A\B;
 
t=1:0.01:n;
n=length(t);
 
j=1:2;
k=1:4;
 
for i=1:n-1
    AA_new=[t(i)^3 t(i)^2 t(i) 1; t(i+1)^3 t(i+1)^2 t(i+1) 1];
    AA(j,k)=AA_new;
    j=j+2;
    k=k+4;
end
 
j=2*n-1;
k=1:8;
 
for i=1:n-2
    AA_new=[3*t(i+1)^2 2*t(i+1) 1 0 -3*t(i+1)^2 -2*t(i+1) -1 0];
    AA(j,k)=AA_new;
    j=j+1;
    k=k+4;
end
 
j=3*n-3;
k=1:8;
 
for i=1:n-2
    AA_new=[6*t(i+1) 2 0 0 -6*t(i+1) -2 0 0];
    AA(j,k)=AA_new;
    j=j+1;
    k=k+4;
end

j=4*n-5;
k=1:4;

for i=1:99
    AA_new=[1 0 0 0];
    AA(j,k)=AA_new;
    k=k+4;
end

j=4*n-4;
k=4*n-7:4*n-4;

for i=1:101;
    AA_new=[1 0 0 0];
    AA(j,k)=AA_new;
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
 
X_n=[x1 x2 x3 x4 x5 x6 x7 x8 x9];
X_new=repmat(X_n,100,1);
XX=X_new(:);
tt=1:10;
G=AA*XX;
for i=1:n;
    g(i)=G(2*i-1);
end

figure(1)
plot(tt,x)
hold on
plot(t,g,'r')
hold off

a = 1;
b = length(x);
fine = 100;


%output_array = g(a:b/(fine*(b)):b)
output_array = [t;g]

%output_array = [transpose(output_array_x); transpose(output_array_y)]
figure(2)
hold on
plot(t,g,'r')
plot(output_array, 'y')
hold off
