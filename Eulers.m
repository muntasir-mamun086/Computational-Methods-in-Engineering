clc; 
clear all; 
close all;
% First step- Function Input and File Creation
a = input('Enter your Function : ','s'); 
fileID = fopen('fofx.m','w');
fprintf(fileID,'function y_val = fofx(x,y)\n\t y_val = %s; \n end',a); 
fclose(fileID); % Close file to save
rehash; % Refresh MATLAB function path
% Second step- Input Parameters
s = input('Enter the number of sub-division : '); 
x0 = input('Enter the initial value of x : '); 
y0 = input('Enter the initial value of y : '); 
xn = input('Enter the value of x : '); 
% Third step- Calculate step size
h = (xn - x0) / s; 
% Fourth step- Initialize arrays
X = zeros(1, s+1);
Y = zeros(1, s+1);
X(1) = x0;
Y(1) = y0;
% Fifth step- Euler's Method Calculation Loop
for i = 1 : s
% Calculate next Y using current X and Y
    Y(i+1) = Y(i) + h * fofx(X(i), Y(i)); 
% Update next X
    X(i+1) = X(i) + h;
end
% Sixth step- Display the result
fprintf('The Solution of the function is : %0.7f\n', Y(s+1));