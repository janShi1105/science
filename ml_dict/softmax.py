import numpy as np

def softmax(x):
    return np.log(1 + np.exp(x))