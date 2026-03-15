clc; 
clear all;      
close all;
% Define the function
f = @(x) x^3 - 2*x - 5; 
% First step-  Choose two numbers  aF and ibr such that |a-b|=1 and f(a)*f(b)<0
for i = 0:100 
   h = i + 1; 
   if f(i) * f(h) < 0 
      a = i; 
      b = h; 
      break; 
   end 
end 
e = 0.000001; % Tolerance for fourth step
for n = 1:100 
    p(n) = a; 
    q(n) = b; 
    fa = f(a); 
    fb = f(b); 
% Second step- find xn = (a*f(b) - b*f(a)) / (f(b) - f(a))
    x = (a*fb - b*fa) / (fb - fa); 
    g(n) = x; % Store xn 
    fxn = f(x);
    res(n) = fxn; % Store f(xn) 
% Fourth step- If |f(xn)| <= e then break the loop and accept xn as a root
    if abs(fxn) <= e 
        break; 
    end 
% Third step- if f(xn) < 0 then set a = xn otherwise set b = xn
    if fxn < 0 
        a = x; 
    else 
        b = x; 
    end 
end 
% Fifth step- Show the iteration table and final root
k = 1:n; 
% Iteration table format: [Iteration_No, xL, xup, xn, f(xn)]
s = [k' p' q' g' res']; 
fprintf('The Iteration Table=\n');
fprintf('    Iter no.     a        b        xn        f(xn)\n');
disp(s); % Display the iteration table
fprintf('\nFinal Root found at x ≈ %.8f after %d iterations\n', g(n), n);