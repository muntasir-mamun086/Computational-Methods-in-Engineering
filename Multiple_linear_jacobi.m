clc;
clear all;
close all;
% First step- Input the Coefficient Matrix and Source Matrix 
mat_A = input('Enter the Coefficient Matrix : '); 
mat_B = input('Enter the source Matrix : '); 
% Show the Augmented Matrix
fprintf("\nThe Argument Matrix :\n");
aug_m = [mat_A mat_B];
disp(aug_m);
[row_A, colmn_A] = size(mat_A);
err = 1E-5; % Error selected for convergence
% Second step-  Initiate all the assumption roots are zero 
k = 1; 
for i = 1:row_A
    root(k, i) = 0; % Initial guess at k=1
end
while(true)
% Third step- Find all the roots using the Jacobi formula 
    for i = 1: row_A
        sum_val = 0;
        for j = 1 : colmn_A
            if i ~= j
                sum_val = sum_val + mat_A(i,j) * root(k,j);
            end
        end
        root(k+1, i) = (mat_B(i,1) - sum_val) / mat_A(i,i);
    end
    k = k + 1;
% Fourth step- Check the difference from previous iteration 
    max_diff = 0;
    for i = 1 : row_A
        diff = abs(root(k, i) - root(k-1, i));
        if diff > max_diff
            max_diff = diff;
        end
    end
 % Fifth step- If the difference is less than the error selected 
    if max_diff < err
        break;
    end
end
% Sixth step- Show the iteration by table 
fprintf("Jacobi Method\n");
fprintf("%15s", "Iteration No.");
for i = 1:row_A
    fprintf("%12s%d", "root", i);
end
fprintf("\n");   % To ensure the next row starts on a new line
for i = 1 : k
    fprintf("%10d      ", i);
    for j = 1 : row_A
        fprintf("%12.4f ", root(i, j));
    end
    fprintf("\n");
end
% Seventh step- Show all the output roots 
fprintf("Final output roots:\n");
for i = 1:row_A
    fprintf("x%d = %.6f\n", i, root(k, i));
end