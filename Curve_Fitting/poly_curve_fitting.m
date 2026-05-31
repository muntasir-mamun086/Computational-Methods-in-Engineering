function crv = poly_curve_fitting(x, y, n)
% First step- Input the X and Y value by row Matrix
% Second step- Input the order of polynomial denoted by n
% Third step- Find the required sum of x_i, x_i^2, etc.
    len = length(x);
    lt = n;
for i = 1 : 2*lt
           sum_x = 0;
for j = 1 : len
               sum_x = sum_x + (x(j))^(i);
end
           store_x(i+1) = sum_x;
end
for k = 1 : lt+1
           sumx = 0;
for s = 1 : len
               sumx = sumx + ((x(s))^(k-1)) * y(s);
end
           str_x(k) = sumx;
end
% Fourth step- Implement the augmented matrix
for i = 1 : n+1
           store_x(1) = n;
for j = 1 : n+1
               am(i,j) = store_x(j+i-1);
end
           am(1,1) = len;
end
for d = 1 : n+1
for s = 1 : n+1
               am(d,s);
end
end
for r = 1 : n+1
           dm(r,1) = str_x(r);
end
       am;
       dm;
       A = am;
       C = dm;
       aug_mt = [A C];
% Fifth step- Find out the solutions (Coefficients)
       aug_mt = rref(aug_mt);
for m = 1 : n+1
           sol_m(m) = aug_mt(m, n+2);
           st_m(m,1) = sol_m(m);
end
% Sixth step- Build up equations for the output value
       [row col] = size(aug_mt);
       X = x(1) : 0.1 : x(len);
       len_x = length(X);
for d = 1 : len_x
           sum_f = 0;
for t = 1 : row
           sum_f = sum_f + sol_m(t) * (X(d))^(t-1);
           w(d) = sum_f;
           Y = w;
end
end
% Seventh step- Plot the Output graph and show Coefficients
       plot(X, Y)
       fprintf("\n The Coefficient Matrix :\n");
       disp(st_m')
end