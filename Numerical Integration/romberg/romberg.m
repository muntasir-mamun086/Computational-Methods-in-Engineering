function Rm = romberg(x0,x1,h)
format compact;
format long;
a = input('\nEnter Your Function for Integration : ','s');
fileID = fopen('fofx.m','w');
fprintf(fileID,'function y = fofx(x) \n y =%s ; \n end',a);
h = h';
x0 = 0;
x1 = 1;
len_h = length(h);
for i = 1 : len_h
    q = y(x0,x1,h(i));
    H(i) = q;
    D(i,1) = q;
end
c =   len_h -1;
for t = 1 : c
    for k = 1 : c
        H(k) = fx(H(k),H(k+1));
        T(t,k) = H(k);
    end
    c = c - 1;
end
T = T';
fprintf('\n\n');
for e = 1 : t
    for f = 1 : t
        if e == 1
            for l = 1 : t+1
            TT(l,e) =  D(l,1);
            end
        end
        TT(e,f+1) = T(e,f);
    end
end
disp(TT);
end