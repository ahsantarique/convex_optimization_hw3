xls = A_train\b_train;


trainlossls = A_train * xls - b_train;
trainlossls = sqrt(transpose(trainlossls)*trainlossls);
disp('least square train loss:');
disp(trainlossls);






testlossls = A_test * xls - b_test;
testlossls = sqrt(transpose(testlossls)*testlossls);
disp('least square test loss:');
disp(testlossls);

