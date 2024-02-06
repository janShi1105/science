import linearreg
import numpy as np
import csv

Xy = []
with open('winequality-red.csv') as fp:
    for row in csv.reader(fp, delimiter = ";"):
        Xy.append(row)
Xy = np.array(Xy[1:], dtype=np.float64)

np.random.seed(0)
np.random.shuffle(Xy)
train_X = Xy[:-1000, :-1]
train_y = Xy[:-1000, -1]
test_X = Xy[-1000:, :-1]
test_y = Xy[-1000:, -1]

model = linearreg.LinearRegresion()
model.fit(train_X, train_y)

y = model.predict(test_X)

print('Targets and predicted of five from first:')
for i in range(5):
    print("{:1.0f}{:5.3f}".format(test_y[i], y[i]))
print()
print("RMSE:",np.sqrt(((test_y - y)**2).mean()))