import matplotlib.pyplot as plt
import csv
import pca
import numpy as np

Xy = []
with open('winequality-red.csv') as fp:
    for row in csv.reader(fp, delimiter = ';'):
        Xy.append(row)
Xy = np.array(Xy[1:], dtype=np.float64)
X = Xy[:, :-1]

model = pca.PCA(n_components=2)
model.fit(X)

Y = model.transform(X)

plt.scatter(Y[:, 0], Y[:, 1], color='k')
plt.show()
