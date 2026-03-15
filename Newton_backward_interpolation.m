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
% Calling the backward interpolation function
interpolationB(x, y, z);
function interpolationB(x, y, z) 
% Second step-Find the difference of the value of X.
    diffr = x(2) - x(1); 
    lt = length(x); 
% Fourth step- Find the value of p by equations of p = (x - xn) / h
    p = (z - x(lt)) / diffr; 
    yvalue = y(lt); 
    DEL = Delta(y, lt); 
% Fifth step- Find the value of yn(x) by using backward formulae.
    for v = 1 : lt-1 
        yvalue = yvalue + DEL(v) * (pT(p, v-1)) / (factorial(v)); 
    end 
% Sixth step-  Show the final output answer.
    fprintf("\nThe output Y(x) in Newton's Backward Formulae: %f\n", yvalue); 
% Function to calculate Backward Difference Table
    function delta = Delta(y_value, lenth) 
        for i = 1 : lenth 
            del(i,1) = y_value(i); 
        end 
% Third step- Substitute process of previous Delta
        for j = 2 : lenth 
            for i = lenth : -1 : j 
                del(i,j) = del(i,j-1) - del(i-1,j-1); 
            end 
        end 
% Sixth step-  Show the iteration/table of ∆
        fprintf('\nThe Output table of ∆ (Backward Table):\n\n');
        disp(del); 
% Extracting backward difference values for formula
        for k = 2 : lenth 
            delta(k-1) = del(lenth, k); 
        end 
    end 
% Function to calculate p(p+1)(p+2)...
    function pt = pT(p, m) 
        pt = 1; 
        for s = 0:m 
            pt = pt * (p + s); 
        end 
    end 
end