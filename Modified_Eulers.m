clc; 
clear all; 
close all;
% First step- Input and File Creation
a = input('Enter your Function : ','s'); 
fileID = fopen('fofx.m','w'); 
fprintf(fileID,'function y_val = fofx(x,y)\n\t y_val = %s; \n end',a); 
fclose(fileID); % Close file to save
rehash; % Refresh MATLAB function path
% Second step- Parameters Input
s = input('Enter the number of sub-division : '); 
x0 = input('Enter the initial value of x : '); 
y0 = input('Enter the initial value of y : '); 
xn = input('Enter the value of x : '); 
% Third step- Calculate step size
h = (xn - x0) / s; 
% Fourth step- Initialize x values
X_vals = zeros(1, s+1);
for j = 1 : s+1 
    X_vals(j) = x0 + (j-1)*h; 
end 
% Fifth step- Modified Euler Loop
sy = zeros(1, s+1);
sy(1) = y0; 
for k = 1 : s 
    y_predict = sy(k) + h * fofx(X_vals(k), sy(k));
    yy = zeros(1, 10001); 
    yy(1) = y_predict; 
    for m = 1 : 10000 
        yy(m+1) = sy(k) + (h/2) * (fofx(X_vals(k), sy(k)) + fofx(X_vals(k+1), yy(m))); 
 % Check for convergence
        if abs(yy(m+1) - yy(m)) < 0.00001  
            sy(k+1) = yy(m+1); 
            break; 
        end 
    end 
end  
% Sixth step- Display the result
fprintf('The Solution of the function is : %0.7f\n', sy(s+1));