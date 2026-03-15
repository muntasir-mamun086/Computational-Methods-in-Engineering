clc; 
clear all; 
close all;
% First step- Input Coefficient matrix and Source matrix
fprintf("Enter your Coefficient matrix : \n"); 
A = input(""); 
fprintf("Enter your sourcet matrix : \n"); 
B = input(""); 
% Second step- Make the Argument Matrix
aug_m = [A B]; 
D = aug_m;  
[row, colm] = size(D); 
% Third step- Make the upper triangular matrix
for i = 1:row 
    for j = i+1:row
% Formula: (Row_j) = (Row_j) - (a_ji/a_ii) * (Row_i)
        m = D(j,i) / D(i,i); 
        D(j, i:colm) = D(j, i:colm) - m * D(i, i:colm); 
    end 
end 
% Fourth and Fifth step-Find each and every root starting from the last element
rt = zeros(row, 1); 
for i = row:-1:1 
    sum_val = 0; 
    for j = i+1:row 
        sum_val = sum_val + rt(j) * D(i,j); 
    end 
    rt(i) = (D(i, colm) - sum_val) / D(i, i); 
end 
% Sixth step- Show the results
fprintf("\nThe Aurgument Matrix : \n"); 
disp(aug_m);
fprintf("\nUpper triangle matrix : \n"); 
disp(D);
fprintf("\nRoots_are : \n"); 
% Row vector format
disp(rt');