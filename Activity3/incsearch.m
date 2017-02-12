function xb = incsearch(func,x0,ns)
% incsearch: incremental search root locator
%   xb = incsearch(func,xmin,xmax,ns):
%     finds brackets of x that contain sign changes
%     of a function on an interval
% input:
%   func = name of function
%   x0 = the initial guess
%   ns = number of subintervals (default = 50)
% output:
%   xb the other boundary

if nargin < 3
    ns = 50; 
end %if ns blank set to 50
xmin = x0-5;
xmax = x0+5;

% Incremental search
x = linspace(xmin,xmax,ns);
xb = []; %xb is null unless sign change detected
for k = 1:length(x)-1
  if func(x(k))*func(x0)<0 %check for sign change
    xb = x(k);
  end
end
if isempty(xb) && ns<1000 %display that no brackets were found
  disp('no brackets found')
  disp('increasing ns...')
  xb = incsearch(func,x0,2*ns);
end