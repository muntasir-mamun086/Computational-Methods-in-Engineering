clc;
clear all;
close all;
% Get the function from the user
a = input(" Enter your function : ", "s");
% Creating ffx.m for the main function
fileID1 = fopen("ffx.m", "w");
fprintf(fileID1, "function y = ffx(x)\n\ty = %s;\nend", a);
fclose(fileID1);
syms x;
f_sym = str2sym(a);
df_sym = diff(f_sym, x);
fileID2 = fopen("dffx.m", "w");
fprintf(fileID2, "function y = dffx(x)\n\ty = %s;\nend", char(df_sym));
fclose(fileID2);
% Refresh MATLAB to recognize the new files
rehash;
% First step- Choose real number 'x0'
x0 = 1;
e = 0.000001;
% Second step- If f'(x0) do not exist then x0 = x0 + 1
if dffx(x0) == 0
    x0 = x0 + 1;
end
for i = 1:100
% Sixth step- Show iteration data
    store(i)     = x0;
    storeffx(i)  = ffx(x0);
    storedffx(i) = dffx(x0);
% Third step- Find x1 = x0 - f(x0)/f'(x0)
    x1 = x0 - (storeffx(i) / storedffx(i));
% Fifth step- If |x0 - x1| <= e then break
    if abs(x0 - x1) <= e
        break;
    end
% Fourth step- Set x0 = x1 and repeat
    x0 = x1;
end
fprintf("\n Root of the function = %f\n\n", store(i));
fprintf("%10s%20s%20s%20s\n", "Iteration Number", "roots", "ffx(x)", "dffx(x)");
for j = 1:80
    fprintf('-');
end
fprintf("\n");
for k = 1:i
    fprintf("%10d%27f%20f%20f\n", k, store(k), storeffx(k), storedffx(k));
end