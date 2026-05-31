clc;
clear;
% First step- Function Input and File Creation
a = input('Enter your Function : ','s');
fileID = fopen('fofx.m','w');
fprintf(fileID,'function y = fofx(x,y)\n\t y = %s; \n end',a);
% Second step- Input Parameters
s = input('Enter the number of sub-division :  ');
x0 = input('Enter the initial value of x :  ');
y0 = input('Enter the initial value of y :  ');
x = input('Enter the  value of x :  ');
% Third step- Calculate step size
if x > x0
    h = (x - x0) / s;
else
    h = (x0 - x) / s;
end
% Fourth step- Initialize arrays
for j = 1 : s
if j == 1
        x(j) = x0 + h;
else
        x(j) = x(j-1) + h;
end
end
% Fifth step- Euler's Method Calculation Loop
for i = 1 : s
if i == 1
        y(i) = y0 + h * fofx(x0, y0);
else
        y(i) = y(i-1) + h * fofx(x(i-1), y(i-1));
end
end
% Sixth step- Display the result
fprintf('The Solution of the function is : %0.7f\n', y(s));