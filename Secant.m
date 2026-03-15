clc;
clear all;
close all;
% Get the function from the user
a = input(" Enter your function : ","s");
% Create a temporary function file to handle user input
fileID = fopen("ffx.m","w");
fprintf(fileID, "function y = ffx(x)\n\ty = %s;\nend", a);
fclose(fileID);
% Refresh file system to recognize the new ffx.m
rehash;
% First step- Choose two real numbers 'xi-1' and 'xi' randomly
x_im1 = 0; % It is xi-1
x_i = 1; % It is xi
e = 0.000001;
temp_0 = x_im1; temp_1 = x_i;
for j = 1:50
f0 = ffx(temp_0); f1 = ffx(temp_1);
temp_2 = (temp_0 * f1 - temp_1 * f0) / (f1 - f0);
if abs(temp_2 - temp_1) <= e, final_root = temp_2;
break;
end
temp_0 = temp_1; temp_1 = temp_2;
end
fprintf(" Root of the function= %f\n\n", final_root);
fprintf("%12s%13s%17s%20s%23s\n","Iteration Number","roots","x1","x0","ffx(x2)");
for j = 1:100
fprintf('-');
end
fprintf("\n");
for i = 1:100
% Second step- Find xi+1 = (xi-1 * fi - xi * fi-1) / (fi - fi-1)
fi = ffx(x_i);
fim1 = ffx(x_im1);
if (fi - fim1) == 0
error('Zero denominator encountered.');
end
% Calculating x_ip1 (xi+1)
x_ip1 = (x_im1 * fi - x_i * fim1) / (fi - fim1);
% Fifth step- Show the iteration
fprintf("%10d%20f%20f%20f%20f\n", i, x_ip1, x_i, x_im1, ffx(x_ip1));
% Fourth step- If |xi+1 - xi| <= e then break the loop ---
if abs(x_ip1 - x_i) <= e
break;
end
% Third step- Set xi-1 = xi and xi = xi+1 (Update for next iteration)
x_im1 = x_i;
x_i = x_ip1;
end
% Cleanup temporary file
if exist('ffx.m', 'file')
delete('ffx.m');
end