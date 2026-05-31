function intrpl = interpolationB(x, y, z)
% First step- Input the value of X and Y in Row Matrix form and also input the value of x to find.
% Second step- Find the difference of the value of X.
    diffr = x(2) - x(1);
    lt = length(x);
% Fourth step- Find the value of p by equations of p = (x - xn) / h
    p = (z - x(lt)) / diffr;
    yvalue = y(lt);
    DEL = Delta(y, lt);
% Fifth step- Find the value of yn(x) by using backward formulae.
for v = 1 : lt-1
        yvalue = yvalue + DEL(v) * (pT(p, v-1)) / (factorial(v));
end
% Sixth step- Show the final output answer.
    fprintf("\n\n");
    intrpl = fprintf("The output Y(x) in Newton's Backward Formulae : %f", yvalue);
function delta = Delta(y_value, lenth)
% Third step- Substitute process of previous Delta
for i = 1 : lenth
            del(i, 1) = y_value(i);
            Del(i, 1) = y_value(i);
end
for j = 2 : lenth
for i = j : (length(del(:, j-1)))
                del(i, j) = del(i, j-1) - del(i-1, j-1);
                Del(i-j+1, j) = del(i, j);
end
end
% Sixth step- Show the iteration/table of ∆ (Backward Table)
        fprintf('\nThe Output table of ∆ (Backward Table):\n\n');
        disp(del);
            delta = del(lenth, 2 : length(Del(:, 1)));
end
function w = factorialt(t)
if t == 0
            w = 1;
return;
else
            w = t * factorial(t - 1);
end
end
% Helper function for p calculation
function pt = pT(p, m)
        pt = 1;
for s = 0 : m
            pt = pt * (p + s);
end
end
end