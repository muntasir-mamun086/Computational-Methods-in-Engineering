clc; 
clear all; 
close all;
format long; 
format compact; 
% First step- Input the function, interval limits and initial h
func_str = input('Enter Your Function for Integration : ', 's');
f = inline(func_str); % Defining the function
x0 = input('Enter the lower limit : '); 
x1 = input('Enter the upper limit : '); 
% Input h values in row matrix form as shown in your previous examples
h_vals = input('Enter the h value in the row matrix form : '); 
len_h = length(h_vals);
R = zeros(len_h, len_h); % Matrix to store iteration values
for i = 1 : len_h
    h = h_vals(i);
% Second step- Find values of Y corresponding to X
    x = x0 : h : x1;
    y = f(x);
% Third step- Trapezoidal rule calculation and the formula: (h/2) * [y0 + 2(y1 + y2 + ...) + yn]
    n = length(y);
    sum_mid = sum(y(2 : n-1));
% Fourth step- Output value which is the solution denoted as I(h), I(h/2).....
    R(i, 1) = (h/2) * (y(1) + 2*sum_mid + y(end));
end
% Richardson Extrapolation (Iteration process)
% Fifth step- Find next iteration values using Romberg formula and formula logic: I(h, h/2) = 1/3 * [4*I(h/2) - I(h)]
for j = 2 : len_h
    for i = 1 : (len_h - j + 1)
     R(i, j) = (1/3) * (4 * R(i+1, j-1) - R(i, j-1));
% Sixth step- Loop continues until the table is filled or converged
    end
end
% Seventh step- Take the Final value
final_solution = R(1, len_h);
% Eight step- Show the Iteration table and Solution
fprintf('\nRomberg Iteration Table\n\n');
% Display the final iteration table 
disp(R);
fprintf('\nFinal Solution : %.10f\n', final_solution);