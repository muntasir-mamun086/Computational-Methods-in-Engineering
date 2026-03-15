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
f_sym = str2sym(a);      % Converts string input to symbolic expression safely
df_sym = diff(f_sym, x); % Calculates derivative
fileID2 = fopen("dffx.m", "w"); 
fprintf(fileID2, "function y = dffx(x)\n\ty = %s;\nend", char(df_sym)); 
fclose(fileID2);
rehash; % Refresh MATLAB to recognize the new files
% First step- Choose real number 'x0' 
x0 = 1; % Initial guess
e = 0.000001; 
% Second step- If f '(x0) do not exist then x0 = x0 + 1
if dffx(x0) == 0 
    x0 = x0 + 1; 
end
temp_x = x0;
final_root = x0;
for j = 1:100
    d_val = dffx(temp_x);
    if d_val == 0, break; end
    next_x = temp_x - (ffx(temp_x) / d_val);
    if abs(next_x - temp_x) < e
        final_root = next_x;
        break;
    end
    temp_x = next_x;
end
fprintf(" Root of the function= %f\n\n", final_root);
fprintf("%10s%20s%20s%20s\n", "Iteration Number", "roots", "ffx(x)", "dffx(x)"); 
for j = 1:80, fprintf('-'); end 
fprintf("\n");
for i = 1:100
% Sixth step- Show iteration data
    store(i) = x0; 
    storeffx(i) = ffx(x0); 
    storedffx(i) = dffx(x0); 
% Third step- find x1
    x1 = x0 - (storeffx(i) / storedffx(i)); 
% Fifth step-  If |x0 - x1| <= e then break
    if abs(x0 - x1) < e 
        break; 
    end
% Fourth step-Set x0 = x1 and repeat
    x0 = x1; 
end
% Display the iteration table
for k = 1:i 
    fprintf("%10d%27f%20f%20f\n", k, store(k), storeffx(k), storedffx(k)); 
end
% Cleanup
delete('ffx.m');
delete('dffx.m');