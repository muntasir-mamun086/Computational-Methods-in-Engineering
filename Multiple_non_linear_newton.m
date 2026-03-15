clc;
clear all;
close all;
% First step- Choose initial real numbers 'x0' and 'y0'
syms x y;
z1 = input('Enter your function for f(x,y) : ', 's'); 
z2 = input('Enter your function for g(x,y) : ', 's'); 
% Creating external function files for calculation
fileID1 = fopen('ffx.m','w'); 
fprintf(fileID1, "function d = ffx(x,y)\n\td = %s;\nend", z1); 
fclose(fileID1);
fileID2 = fopen('gfx.m','w'); 
fprintf(fileID2, "function d = gfx(x,y)\n\td = %s;\nend", z2); 
fclose(fileID2);
rehash; % Refresh MATLAB to recognize the new files
x0 = 1.0; % Initial guess x0
y0 = 1.0; % Initial guess y0
err = 0.000001;
maxIter = 100;
fprintf("\n%10s%20s%20s\n", "Iteration Number", "x1", "y1"); 
for j = 1:60 
    fprintf('-'); 
end 
fprintf("\n");
for i = 1:maxIter
% Second step- Find partial derivatives and make matrices 
% Symbolic differentiation
    f_sym = str2sym(z1);
    g_sym = str2sym(z2);
    fx = diff(f_sym, x);
    fy = diff(f_sym, y);
    gx = diff(g_sym, x);
    gy = diff(g_sym, y);
% Evaluating derivatives at (x0, y0)
    a = double(subs(fx, {x, y}, {x0, y0}));
    b = double(subs(fy, {x, y}, {x0, y0}));
    c = double(subs(gx, {x, y}, {x0, y0}));
    d = double(subs(gy, {x, y}, {x0, y0}));
% Coefficient Matrix (Jacobian)
    A = [a, b; c, d];
% Source Matrix (Negative of function values)
    f0 = ffx(x0, y0);
    g0 = gfx(x0, y0);
    S = [-f0; -g0];
% Third step- find 'h' and 'k' through the matrix 
% Using Matrix Division (h and k are the solutions to A*delta = S)
    delta = A \ S;
    h = delta(1);
    k = delta(2);
% Fourth step- find x1 = x0 + h and y1 = y0 + k ---
    x1 = x0 + h;
    y1 = y0 + k;
% Store values for the table
    storex(i) = x1;
    storey(i) = y1;
% Seventh step- Show the iteration ---
    fprintf("%9d%30f%20f\n", i, x1, y1);
% Fifth and Sixth step-Check difference and break if < 0.000001 
    if (abs(x1 - x0) < err) && (abs(y1 - y0) < err)
        break;
    end
% Update for next iteration
    x0 = x1;
    y0 = y1;
end
% Cleanup temporary files
delete('ffx.m');
delete('gfx.m');