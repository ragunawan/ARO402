%% Plots
x_i = 0;
x_u = incsearch(@func_act3, x_i);

f_cur = f_pre;

bisect_pre = bisect(@func_act3, x_i, x_u, [], 1);
bisect_cur = bisect_pre;
 
figure(2)
hold on

for n = 2:1:20
   bisect_cur = bisect(@func_act3, x_i, x_u, [], n);
   
   bisect_err = bisect_cur-bisect_pre;
   bisect_pre = bisect_cur;
   
  % value_f_cur = fzero(@func_act3, 
    
  plot(n, bisect_err, '--o')

end

hold off