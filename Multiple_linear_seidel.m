clc; 
clear all; 
close all; 
% First step- Input the Coefficient Matrix and Source Matrix by the form of matrix A and B.
mat_A = input('Enter the Coefficient Matrix : \n'); 
mat_B = input('Enter the source Matrix : \n'); 
format compact; 
% Calling Gauss-Seidel Function
gaussSeidel(mat_A, mat_B); 
function gaussSeidel(mat_A, mat_B) 
    [row_A, colmn_A] = size(mat_A); 
    [row_B, colmn_B] = size(mat_B); 
    err = 1E-5; 
    if row_A ~= row_B || colmn_B ~= 1 
        fprintf("The dimension of matrix is not valid\n"); 
        return;
    else 
        fprintf("\nThe Argument Matrix :\n");
        aug_m = [mat_A mat_B]; 
        disp(aug_m);
    end 
% Second step- Initiate all the assumption roots are zero.
    k = 1; 
    stored_root(k, 1:row_A) = 0; 
    while(true) 
        current_root = stored_root(k, :); 
         for i = 1: row_A 
            sum_val = 0; 
            for j = 1 : colmn_A 
                if i ~= j 
% Fourth step- Use the gotten roots to find the immediate roots.
             sum_val = sum_val + mat_A(i,j) * current_root(j); 
                end 
            end 
% Third step- Find the roots use Gauss-Seidel formula.
            current_root(i) = (mat_B(i,1) - sum_val) / mat_A(i,i); 
        end 
        stored_root(k+1, :) = current_root; 
        k = k + 1;  
% Fifth step-Check the difference from previous iteration to following equations.
        diff_val = max(abs(stored_root(k, :) - stored_root(k-1, :)));
% Sixth step- If the difference is less than the error selected.
        if diff_val < err 
            break; 
        end 
    end  
% Seventh step- Show the iteration by table
    fprintf("\nGauss Seidel Method\n"); 
    fprintf("%15s", "Iteration No."); 
    for i = 1 : row_A
        fprintf("%12s%d", "root", i); 
    end 
    fprintf("\n");  % To ensure the next row starts on a new line
    for i = 1 : k 
        fprintf("%10d      ", i); 
        for j = 1 : row_A
            fprintf("%12.4f ", stored_root(i, j));
        end
        fprintf("\n");  % To ensure the next row starts on a new line
    end 
% Eight step- Show all the output roots.
    fprintf("\nFinal output roots:\n");
    for i = 1:row_A
        fprintf("x%d = %.6f\n", i, stored_root(k, i));
    end
end