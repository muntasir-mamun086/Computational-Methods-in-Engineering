clc;
clear all;
close all;
% First step- Input Coefficient matrix and Source matrix
fprintf("Enter your Coefficient matrix : \n\t\t\t\t\t\t\t\t");
A = input("");
fprintf("Enter your sourcet matrix : \n\t\t\t\t\t\t\t\t");
B = input("");
% Second step- Make the Argument Matrix
aug_m=[A B];
D = aug_m;
[row, colm] = size(D);
% Third step- Make the upper triangular matrix
for i = 1: row
for j = i+1 :row;
% Formula: (Row_j) = (Row_j) - (a_ji/a_ii) * (Row_i)
    m = D(j,i)/D(i,i);
    D(j,i:colm)=D(j,i:colm)- m*D(i,i:colm);
end
end
% Fourth and Fifth step- Find each and every root starting from the last element
for i=1:row
    rt(i)=0;
end
for i= row:-1:1
for j=1:colm-1
if i~=j
            rt(i)=rt(i)+rt(j)*D(i,j);
end
end
    rt(i) = (D(i,colm)-rt(i))/D(i,i);
end
% Sixth step- Show the results
fprintf("The Aurgument Matrix : ");
aug_m
fprintf("\nUpper triangle matrix : ");
D
Roots_are = rt;
Roots_are