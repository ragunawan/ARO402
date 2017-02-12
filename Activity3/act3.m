%% Week 3 Activity
% Ryan Gunawan, Nigam Dudhat, Talah Qasim

%% Equation
%func = @(x) exp(-x)-x;

%% Bisection Method
x_i = 0
x_u = incsearch(@func_act3, x_i)

[r_bisect,f_x,e_a,iter] = bisect(@func_act3, x_i, x_u)


%% Newton-Raphson Method
r_newtraph = newtraph(@func_act3, @dfunc_act3, 0)

%% IQI Method 
% simpleIQI(@func_act3, [x_i, x_i, x_u])
% [bisect_root, bisect_vals, bisect_err] = bisect(@func_act3, x_i, x_u, [], n);

%% Plots
%semilogy(0:1:20, bisect(@func_act3, x_i, x_u))

figure(1)
hold on
ylim([-0.05 0.5])
f_pre = fzero(@func_act3,0);
f_cur = f_pre;

bisect_pre = bisect(@func_act3, x_i, x_u, [], 1);
bisect_cur = bisect_pre;

for n = 0.1:0.1:20
   bisect_cur = bisect(@func_act3, x_i, x_u, [], n);
   
   bisect_err = bisect_cur-bisect_pre;
   bisect_pre = bisect_cur;
   
  % value_f_cur = fzero(@func_act3, 

   plot(n, bisect_err)
end

hold off

%%
