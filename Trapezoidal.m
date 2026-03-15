clc; 
clear all; 
close all;
format long; 
format compact; 
% First step- Input the function for integration and Input the interval limit and the interval (h)
x0 = input('Input the Lower Limit of the Integration : '); 
x1 = input('Input the Higher Limit of the Integration : '); 
h = input('Input the Interval of division (h) : '); 
% Calling function 
integ_trap(x0, x1, h);
function int = integ_trap(x0, x1, h) 
    format long; 
% First step- (Continued): Input the function for integration
    a = input('\nEnter Your Function for Integration : ','s'); 
% Creating fofx.m file to store the function
    fileID = fopen('fofx.m','w'); 
    fprintf(fileID,'function y = fofx(x) \n y = %s; \n end', a); 
    fclose(fileID);
    rehash; % Refresh MATLAB functions to recognize the new file
% Second step- By using the value of find the value of Y corresponding input X
    xx = x0 : h : x1;
    len = length(xx); 
    for i = 1 : len 
        yy(i) = fofx(xx(i)); 
    end 
% Third step- Find the output by using the value of X and the corresponding Y
    sum_y = 0; 
    for k = 2 : len-1 
        sum_y = sum_y + yy(k); 
    end 
% Fourth step- Find out the Output Value which is the solution
    integ_val = (h/2) * (yy(1) + 2*sum_y + yy(len)); 
% Fifth step- Show the Output value.
    fprintf('\nThe Output Integration value is : %f\n\n', integ_val); 
    int = integ_val;
end