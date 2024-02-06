import numpy as np
from scipy import linalg

class RidgeRegresion:
    def __init__(self, lambda_ = -1):
        self.lambda_ = lambda_
        self.w_ = None

    def fit(self, X, t):
        xtil = np.c_[np.ones(X.shape[0]), X]
        c = np.eye(xtil.shape[1])
        A = np.dot(xtil.T, xtil) + self.lambda_ * c
        b = np.dot(xtil.T, t)
        self.w_ = linalg.solve(A, b) 

    def predict(self, X):
        xtil = np.c_[np.ones(X.shape[0]), X]
        return np.dot(xtil, self.w_)