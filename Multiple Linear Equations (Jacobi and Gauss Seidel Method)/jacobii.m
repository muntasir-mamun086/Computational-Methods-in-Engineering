% First step- Input the Coefficient Matrix and Source Matrix 
function y = jacobii(mat_A,mat_B)
[row_A colmn_A] = size(mat_A);
[row_B colmn_B] = size(mat_B);
err = 1E-5;  % Error selected for convergence
if row_A ~= row_B || colmn_B~=1
    fprintf(" The dimension of matrix is not valid");
else
    fprintf("\n\n");
    aug_m= [mat_A mat_B]
    fprintf("\n\n");
end
% Second step - Initiate all the assumption roots are zero    
k = 1;
for i = 1: row_A
    root(k,i)= 0 ;  % Initial guess at k=1
end 
while(true)
   brk = 0 ;
% Fourth step - Check the difference from previous iteration to following equations.
    if k > 2
        for i = 1 : row_A
% Fifth step - If the difference is less than the error selected.
            if abs(root(k,i)-root(k-1, i)) < err
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
% Third step- Find all the roots using the Jacobi formula 
    for i = 1: row_A
        sum = 0;
        for j = 1 : colmn_A
            if i~=j
                sum = sum + mat_A(i,j) * root(k,j);
            end
        end
        root(k+1, i) = ( mat_B(i,1) - sum)/ mat_A(i,i);
    end
    k = k+1 ; 
end 
% Sixth step- Show the iteration by table 
disp("jacobi Method ");
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
       disp(root(i, :));
   end
% Seventh step- Show all the output roots 
end




