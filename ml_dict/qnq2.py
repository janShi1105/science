import numpy as np

def qnq(a, b,c ):
    alpha = (-b - np.sign(b) * np.sqrt(b**2 - 4 * a * c)) / (2 * a)
    beta = c / (a * alpha)
    return (alpha, beta)