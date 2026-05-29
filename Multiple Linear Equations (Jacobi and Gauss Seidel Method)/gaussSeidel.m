% First step- Input the Coefficient Matrix and Source Matrix 
function y = gaussSiedel(mat_A,mat_B)
[row_A colmn_A] = size(mat_A);
[row_B colmn_B] = size(mat_B);
err = 1E-5;
if row_A ~= row_B || colmn_B~=1
    fprintf(" The dimension of matrix is not valid");
else
    aug_m= [mat_A mat_B];
end
% Second step - Initiate all the assumption roots are zero        
k = 1;
for i = 1: row_A
    root(k,i)= 0 ;
end 
stored_root(k, 1:row_A) = 0;
while(true)
    brk = 0 ;
% Fifth step- Check the difference from previous iteration 
    if k > 1
        for i = 1 : row_A
% Sixth step- If the difference is less than the error selected
            if abs(stored_root(k,i)-stored_root(k-1, i)) < err
                brk = 1;
            else
                brk = 0 ;
                break
            end
        end
    end
    if brk == 1
        break;
    end
% Fourth step- Use the gotten roots to find the immediate roots
    root(k, :) = stored_root(k, :);
% Third step- Find the roots use Gauss-Seidel formula.
    for i = 1: row_A
        sum = 0;
        for j = 1 : colmn_A
            if i~=j
                sum = sum + mat_A(i,j) * root(k,j);
            end
        end
        root(k, i) = ( mat_B(i,1) - sum)/ mat_A(i,i);
    end
    stored_root(k+1, :) = root(k, :);
    k = k+1 ; 
end 
% Seventh step- Show the iteration by table
disp(k);
disp("Gauss Seidel Method  : ");
    for i = 1 : row_A+1
       if i ==1
           fprintf(" Iteration No. ");
       else
            fprintf("%10s%d","root",i-1);
       end
   end
   fprintf("\n");
    for i = 1 : k
       fprintf("%10d",i);
       disp(stored_root(i, :));
    end
% Eight step- Show all the output roots.
end




