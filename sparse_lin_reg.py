import numpy as np

m = 500; n = 5000; k = 5; sigma = 1e-2

# Training set
A_train = np.random.randn(m,n)
index = np.random.choice(n, k)
x = np.zeros((n,1), dtype=np.float); x[index] = 1.0
b_train = np.matmul(A_train, x) + sigma * np.random.randn(m,1)

# Test set
A_test = np.random.randn(100,n)
b_test = np.matmul(A_test, x)
