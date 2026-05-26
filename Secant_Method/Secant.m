clc;
clear all;
close all;
% Get the function from user and write to ffx.m
a = input(" Enter your function : ", "s");
fileID = fopen("ffx.m", "w");
fprintf(fileID, "function y = ffx(x)\n\ty = %s;\nend", a);
fclose(fileID);
% Refresh file system to recognize the new ffx.m
rehash;
% First step- Choose two real numbers x(i-1) and xi randomly
x_im1 = 0;        % It is x(i-1)
x_i   = 1;        % It is x(i)
e     = 0.00001;  % Tolerance
for i = 1:100
    f_im1 = ffx(x_im1);
    f_i   = ffx(x_i);
    if (f_i - f_im1) == 0
        error(' Denominator is zero. Choose different starting points.');
    end
% Second step- Find x(i+1) = (x(i-1)*f(xi) - xi*f(x(i-1))) / (f(xi) - f(x(i-1)))
    x_ip1 = (x_im1 * f_i - x_i * f_im1) / (f_i - f_im1);
% Store for table display
    storex0(i)   = x_im1;
    storex1(i)   = x_i;
    storex2(i)   = x_ip1;
    storeffx2(i) = ffx(x_ip1);
% Fourth step- If |x(i+1) - xi| <= e then break the loop
    if abs(x_ip1 - x_i) <= e
        break;
    end
% Third step- Set x(i-1) = xi and xi = x(i+1) (Update for next iteration)
    x_im1 = x_i;
    x_i   = x_ip1;
end
% Fifth step- Show the iteration table
fprintf("\n Root of the function = %f\n\n", x_ip1);
fprintf("%20s%20s%20s%20s%20s\n", ...
        "Iteration Number", "x(i+1)", "x(i)", "x(i-1)", "f(x(i+1))");
for j = 1:100
    fprintf('-');
end
fprintf("\n");
for k = 1:i
    fprintf("%20d%20f%20f%20f%20f\n", ...
            k, storex2(k), storex1(k), storex0(k), storeffx2(k));
end