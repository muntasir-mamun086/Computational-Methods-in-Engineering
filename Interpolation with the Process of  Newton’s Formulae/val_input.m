clc;
clear;
x = input(" Input the row vector of X value : ");
y = input(" Input the row vector of Y value : ");
z = input("Input the value for find : ");
x = x';
y = y';
disp(interpolationB(x,y,z));