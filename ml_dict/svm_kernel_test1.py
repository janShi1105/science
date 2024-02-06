import numpy as np
import matplotlib.pyplot as plt
import svm

plt.axes().set_aspect('equal')
np.random.seed(0)
x0 = np.random.randn(100, 2)
x1 = np.random.randn(100, 2) + np.array([2.5, 3])
y = np.array([1] * 100 + [-1] * 100)
X = np.r_[x0,x1] 

model = svm.SVC()
model.fit(X, y)

xmin , xmax = X[:, 0].min(), X[: ,0].max()
ymin, ymax = X[:, 1].min(), X[:, 1].max()

plt.scatter(x0[:, 0], x0[:, 1], color='k', marker='*')
plt.scatter(x1[:, 0], x1[:, 1], color='k', marker='+')

xmesh, ymesh = np.meshgrid(np.linspace(xmin, xmax, 200), np.linspace(ymin, ymax, 200))


Z= model.predict(np.c_[xmesh.ravel(), ymesh.ravel()]).reshape(xmesh.shape)
plt.contour(xmesh, ymesh, Z, levels=[0], colors='k')

print('correct classification sum: ', (model.predict(X) == y).sum())

plt.show()