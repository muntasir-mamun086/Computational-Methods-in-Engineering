clc; 
clear all; 
close all;
format long; 
format compact; 
% First step- Input the function for integration and Input the interval limit and the interval (h)
x0 = input('Input the Lower Limit of the Integration : '); 
x1 = input('Input the Higher Limit of the Integration : '); 
h = input('Input the Interval of division (h) : '); 
% Calling the function
integ_syms_1_3(x0, x1, h);
function intg = integ_syms_1_3(x0, x1, h) 
% Fisrt step- (Continued): Input the function string
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
    sum_y1 = 0; 
    for k = 2 : 2 : len-1 
        sum_y1 = sum_y1 + yy(k);  
    end 
% sum_y2 for even positions (y2, y4, y6...) -> index 3, 5, 7... in MATLAB
    sum_y2 = 0; 
    for j = 3 : 2 : len-2 
        sum_y2 = sum_y2 + yy(j);  
    end 
% Fourth step- Find out the Output Value which is the solution and the formula- (h/3) * [y0 + 4*(odd_y) + 2*(even_y) + yn]
    integ_y = (h/3) * (yy(1) + 4*sum_y1 + 2*sum_y2 + yy(len)); 
% Fifth step- Show the Output value.
    fprintf('\nThe Output Integration value is : %f\n\n', integ_y); 
    intg = integ_y;
end