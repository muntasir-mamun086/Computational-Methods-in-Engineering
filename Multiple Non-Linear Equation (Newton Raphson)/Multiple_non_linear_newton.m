clc;
clear
syms('x','y');
z1 = input('Enter your function for f(x) :','s');
fileID1 = fopen('ffx.m','w');
fprintf(fileID1," function d = ffx(x,y)\n\t syms('x','y');\nd = %s;\n end",z1);
z2 = input('Enter your function for g(x) :','s');
fileID2 = fopen('gfx.m','w');
fprintf(fileID2," function d = gfx(x,y)\n\t syms('x','y');\nd = %s;\n end",z2);
% First step- Choose initial real numbers 'x0' and 'y0'
x0 = rand*10;
y0 = rand*10;
for i=1:100
% Second step- Find partial derivatives and make matrices
         k1=diff(ffx(x,y),x);
         f_k1 = sprintf("%s", k1);
         func_k1 = inline(f_k1, 'x', 'y');
         a = func_k1(x0,y0);
         k2=diff(ffx(x,y),y);
         f_k2=sprintf("%s",k2);
         func_k2= inline(f_k2,'x','y');
         b = func_k2(x0,y0);
         k3=diff(gfx(x,y),x);
         f_k3 = sprintf("%s",k3);
         func_k3= inline(f_k3,'x','y');
         c = func_k3(x0,y0);
         k4=diff(gfx(x,y),y);
         f_k4=sprintf("%s",k4);
         func_k4=inline(f_k4,'x','y');
         d = func_k4(x0,y0);
         A = [a,b;c,d];
         fileID3 = fopen('fofx.m','w');
         fprintf(fileID3," function p = fofx(x,y)\n\t p = %s;\nend",z1);
         fileID4 = fopen('gofx.m','w');
         fprintf(fileID4," function p = gofx(x,y)\n\t p = %s;\nend",z2);
         f0 = fofx(x0,y0);
         g0 = gofx(x0,y0);
         S = [-f0;-g0];
% Third step- Find 'h' and 'k' through the matrix
        B =inv(A);
        C=B*S;
        h = C(1,1);
        k = C(2,1);
% Fourth step- Find x1 = x0 + h and y1 = y0 + k
        x1 = x0+h;
        y1 = y0+k;
            storex(i) = x1;
            storey(i) = y1;
            err = 0.00001;
% Fifth step- Check convergence using function values
               r1 = fofx(storex(i),storey(i));
               r2 = gofx(storex(i),storey(i));
if r1<err && r2<err
break
end
% Sixth step- Check difference and break if < err
if i>2
                d1= storex(i)-storex(i-1);
                d2 = storey(i)-storey(i-1);
if (abs(d1)< err)&&(abs(d2)<err)
break
end
end
            x0 = x1;
            y0 = y1;
end
% Seventh step- Show the iteration table
fprintf("\n\n");
fprintf("%20s%20s%20s\n","iteration Number","x1","y1");
for j= 1:60
    fprintf('-');
end
fprintf("\n");
for k= 1:i
    fprintf("%20d%20f%20f\n",k,storex(k),storey(k));
end