import cv2
import os

cap  = cv2.VideoCapture(os.getcwd() + '/mov/mov01.mov')
num = 0
while(cap.isOpened()):
    ret, frame = cap.read()
    if ret:
        cv2.imshow('frame', frame)
        filepath = os.getcwd() + '/snapshot/snapshot_'  +str(num) + '.jpg'
        cv2.imwrite(filepath, frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    num = num + 1
cap.release()
cv2.destroyAllWindows()