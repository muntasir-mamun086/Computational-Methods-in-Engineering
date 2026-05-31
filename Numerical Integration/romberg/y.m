function int = y(x0,x1,h)
len = length(x0 : h : x1);
z = 0 ;
for i = 1 : len
    xx(i) = x0 + h*(i-1);
    yy(i) = fofx(xx(i));
end
sum_y = 0;
for k = 2: len-1
    sum_y = sum_y + yy(k);
    integ_y = (h/2)*( yy(1)+ 2*sum_y+ yy(len));
end
int = integ_y;
end