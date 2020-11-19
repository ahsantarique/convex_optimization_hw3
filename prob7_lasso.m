%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%LS

xls = A_train\b_train;


trainlossls = A_train * xls - b_train;
trainlossls = sqrt(transpose(trainlossls)*trainlossls);
disp('least square train loss:');
disp(trainlossls);



testlossls = A_test * xls - b_test;
testlossls = sqrt(transpose(testlossls)*testlossls);
disp('least square test loss:');
disp(testlossls);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LASSO
lambda = 0.001;

cvx_begin quiet
    cvx_precision low
    variable x(n)
    minimize(sum_square(A_train*x - b_train) + lambda*norm(x,1))
cvx_end

h.x_cvx = x;
h.p_cvx = cvx_optval;
x = h.x_cvx;



trainlasso = A_train * x - b_train;
trainlasso = sqrt(transpose(trainlasso)*trainlasso);
disp('least square train loss:');
disp(trainlasso);






testlasso = A_test * x - b_test;
testlasso = sqrt(transpose(testlasso)*testlasso);
disp('least square test loss:');
disp(testlasso);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% printing to file
fileID = fopen('SLRLASSO_results.txt','w+');
fprintf(fileID, '%g %g %g', xls, trainlossls, testlossls);
fprintf(fileID, '\n');
fprintf(fileID, '%g %g %g', x, trainlasso, testlasso);
fclose(fileID);