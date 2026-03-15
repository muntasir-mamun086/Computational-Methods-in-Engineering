clc; 
clear all;      
close all;
% First step-Choose lower value xL and upper value xup such that f(xL)*f(xup)<0
a = 1; % xL
b = 1.5; % xup
tol = 0.0001; 
% Initial check for sign change
if (a^3-a-1) * (b^3-b-1) >= 0
    error('f(xL) and f(xup) must have opposite signs.');
end
for n = 1:100 
    p(n) = a; 
    q(n) = b; 
% Second step- Find xn = (xL + xup) / 2
    x = (a + b) / 2; 
    g(n) = x; % Store xn
% Calculate f(xn) 
    f_val = x^3 - x - 1; 
    res(n) = f_val; 
% Fourth step- If |a-b| <= tolerance then break the loop
    if abs(a - b) <= tol 
        break; 
    end 
% Third step- If f(xn) < 0 then set a = xn, otherwise set b = xn
    if f_val < 0 
        a = x; 
    else 
        b = x; 
    end 
end 
% Fifth step- Show the iteration number and table
k = 1:n; 
% Iteration table format: [Iteration_No, xL, xup, xn, f(xn)]
s = [k' p' q' g' res'];  
fprintf('The Iteration Table=\n');
fprintf('    Iter no.     xL       xup       xn       f(xn)\n');
disp(s);  % Display the iteration table
fprintf('\nFinal Root found at x ≈ %.6f after %d iterations\n', g(n), n);