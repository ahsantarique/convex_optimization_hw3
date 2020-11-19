trainlasso = A_train * x - b_train;
trainlasso = sqrt(transpose(trainlasso)*trainlasso);
disp('least square train loss:');
disp(trainlasso);






testlasso = A_test * x - b_test;
testlasso = sqrt(transpose(testlasso)*testlasso);
disp('least square test loss:');
disp(testlasso);







fileID = fopen('SLRLASSOx_results.txt','w+');
fprintf(fileID, '%g %g %g', xls, trainlossls, testlossls);
fprintf(fileID, '\n');
fprintf(fileID, '%g %g %g', x, trainlasso, testlasso);
fclose(fileID);