clc;
clear;
format long;
format compact;
x0 = input ('Input the Lower Limit of the Integration: ');
x1 = input ('Input the Higher Limit of the Integration: ' );
h = input('Enter the h value in the row matrix form : ');
romberg(x0,x1,h);