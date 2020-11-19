clearvars
clc;

m = 5e2; n = 5e3; k = 5; sigma = 1e-2;

%% Training set
A_train = randn(m,n); 
x = zeros(n,1); x(randsample(n,k)) = 1;
b_train = A_train*x + sigma*randn(m,1);

%% Test set
A_test = randn(100,n);
b_test = A_test*x;
