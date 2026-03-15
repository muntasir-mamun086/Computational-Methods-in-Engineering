clc; 
clear all; 
close all;
% First step- Input the value of X and Y in Row Matrix form and also input the value of x to find.
x = input(" Input the row vector of X value : "); 
y = input(" Input the row vector of Y value : "); 
z = input(" Input the value for find : "); 
% Convert row vectors to column vectors
x = x'; 
y = y'; 
% Calling the interpolation function
interpolationF(x, y, z);
function interpolationF(x, y, z) 
% Second step- Find the difference of the value of X.
    h = x(2) - x(1); 
    l = length(x); 
% Fourth step- Find the value of p by equations of p = (x - x0) / h
    p = (z - x(1)) / h; 
    yvalue = y(1); 
    DEL = Delta(y, l); 
% Fifth step- Find the value of yn(x) by using forward formulae.
    for v = 1 : l-1 
        yvalue = yvalue + DEL(v) * (pT(p, v-1)) / (pT(v, v-1)); 
    end 
% Sixth step- Show the output answer.
    fprintf("\nThe output Y(x) in Newton’s Forward Formulae: %f\n", yvalue); 
    function delta = Delta(y_value, lenth) 
        for i = 1 : lenth 
            del(i,1) = y_value(i); 
        end 
        for j = 2 : lenth 
            for i = j : lenth 
% Third step- Substitute process of previous Delta
                del(i,j) = del(i,j-1) - del(i-1,j-1); 
            end 
        end 
% Sixth step- Show the iteration/table of ∆
        fprintf('\nThe Output table of ∆ :\n\n');
        disp(del); 
        for k = 2 : lenth 
            delta(k-1) = del(k,k); 
        end 
    end 
% Helper function for p calculation
    function pt = pT(p, m) 
        pt = 1; 
        for s = 0:m 
            pt = pt * (p - s); 
        end 
    end 
end