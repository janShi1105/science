import numpy as np
from scipy import linalg

class LinearRegresion:
    def __init__(self):
        self.w_ = None

    def fit(self, X, t):
        xtil = np.c_[np.ones(X.shape[0]), X]
        A = np.dot(xtil.T, xtil)
        b = np.dot(xtil.T, t)
        self.w_ = linalg.solve(A, b)

    def predict(self, X):
        if X.ndim == 1:
            X = X.reshape(1,-1)
        xtil = np.c_[np.ones(X.shape[0]), X]
        return np.dot(xtil, self.w_)