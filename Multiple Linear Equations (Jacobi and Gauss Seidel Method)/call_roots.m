clc;
clear;
mat_A = input('Enter the Coefficient Matrix  : \n');
mat_B = input('Enter the source Matrix  : \n');
format compact;
jacobii(mat_A,mat_B);
gaussSeidel(mat_A,mat_B);

