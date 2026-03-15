clc; 
clear all; 
close all;
% First step- Input the X and Y value by row Matrix
x_input = input(" Enter the X value in Row Matrix form : "); 
y_input = input(" Enter the Y value in Row Matrix form : "); 
% Second step- Input the order of polynomial denoted by n
n_order = input(" Enter the Order of polynomial (integer number) : "); 
% Function call
poly_curve_fitting(x_input', y_input', n_order); 
function poly_curve_fitting(x, y, n) 
    len = length(x); 
% Third step- Find the required sum of x_i, x_i^2, etc.
    store_x = zeros(1, 2*n+1);
    for i = 1 : 2*n 
        sum_x = 0; 
        for j = 1 : len 
            sum_x = sum_x + (x(j))^i; 
        end 
        store_x(i+1) = sum_x; 
    end 
    store_x(1) = len; % Initial sum of x^0 is length
    str_x = zeros(1, n+1);
    for k = 1: n+1 
        sumxy = 0; 
        for s = 1 : len  
            sumxy = sumxy + ((x(s))^(k-1)) * y(s); 
        end 
        str_x(k) = sumxy; 
    end 
% Fourth step- Implement the augmented matrix
    am = zeros(n+1, n+1);
    for i = 1 : n+1  
        for j = 1 : n+1 
            am(i,j) = store_x(j+i-1); 
        end 
    end 
    dm = str_x'; 
    aug_mt = [am dm]; 
% Fifth step- Find out the solutions (Coefficients)
    aug_mt = rref(aug_mt); 
    sol_m = aug_mt(:, end); % Extract last column
% Sixth step- Build up equations for the output value
    X_plot = min(x) : 0.1 : max(x); 
    Y_plot = zeros(size(X_plot));
    for d = 1 : length(X_plot) 
        sum_f = 0; 
        for t = 1 : (n + 1)
            sum_f = sum_f + sol_m(t) * (X_plot(d))^(t-1); 
        end 
        Y_plot(d) = sum_f; 
    end 
% Seventh step- Plot the Output graph and show Coefficients
    figure;
    plot(x, y, 'ro', 'MarkerFaceColor', 'r'); 
    hold on; % Original Data points
    plot(X_plot, Y_plot, 'b-', 'LineWidth', 2); % Fitted Curve
    grid on;
    title(['Curve Fitting with Polynomial Order: ', num2str(n)]);
    xlabel('X values'); 
    ylabel('Y values');
    fprintf("\n The Coefficient Matrix :\n"); 
    disp(sol_m');
end