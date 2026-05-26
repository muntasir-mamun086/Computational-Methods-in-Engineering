clc; 
clear all;      
close all;
% First step - Choose lower value xL (a) and upper value xup (b)
a = 2;   % xL
b = 3;   % xup
tol = 0.0001; 
% Initial check for sign change
if (a^3-2*a-5) * (b^3-2*b-5) >= 0
    error('f(xL) and f(xup) must have opposite signs.');
end
for n = 1:100 
    p(n) = a; % Store current xL
    q(n) = b; % Store current xup
% Second step - Find xn = (xL + xup) / 2
    x = (a + b) / 2; 
    g(n) = x; % Store xn
% Calculate f(xn) 
    f_val = x^3 - 2*x - 5; 
    res(n) = f_val; 
% Third step - Update intervals based on sign
    if f_val < 0 
        a = x; 
    else 
        b = x; 
    end 
 % Fourth step - Check tolerance AFTER updating a and b
    if abs(a - b) <= tol 
        break; 
    end 
end
% Fifth step - Show the iteration number and table
k = 1:n; 
% Iteration table format: [Iteration_No, xL, xup, xn, f(xn)]
s = [k' p' q' g' res'];  
fprintf('The Iteration Table=\n\n');
fprintf('    Iter no.     xL       xup       xn       f(xn)\n');
% Display the iteration table
disp(s);  
