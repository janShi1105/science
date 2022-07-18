import cv2
import os

print(os.getcwd())
img = cv2.imread(os.getcwd() + '/img/img01.jpg')

height, width = img.shape[:2]
print('画像幅: ' + str(width))
print('画像高さ: ' + str(height))
cv2.imshow('img', img)
cv2.waitKey(0)