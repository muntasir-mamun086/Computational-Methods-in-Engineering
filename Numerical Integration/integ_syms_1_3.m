function intg = integ_syms_1_3(x0, x1, h)
% First step- Input the function for integration and Input the interval limit and the interval (h)
    format long;
    len = length(x0 : h : x1);
    z = 0;
    a = input('\nEnter Your Function for Integration : ', 's');
    fileID = fopen('fofx.m', 'w');
    fprintf(fileID, 'function y = fofx(x) \n y = %s ; \n end', a);
% Second step- By using the value of find the value of Y corresponding input X
for i = 1 : len
        xx(i) = x0 + h * (i-1);
        yy(i) = fofx(xx(i));
end
% Third step- Find the output by using the value of X and the corresponding Y
    sum_y1 = 0;
for k = 2 : 2 : len
        sum_y1 = sum_y1 + yy(k);
end
    sum_y2 = 0;
for j = 3 : 2 : len-1
        sum_y2 = sum_y2 + yy(j);
end
% Fourth step- Find out the Output Value which is the solution and the formula- (h/3) * [y0 + 4*(odd_y) + 2*(even_y) + yn]
    integ_y = (h/3) * (yy(1) + 4*sum_y1 + 2*sum_y2 + yy(len));
% Fifth step- Show the Output value.
    fprintf('\nThe Output Integration value is : %0.14f\n\n', integ_y);
end