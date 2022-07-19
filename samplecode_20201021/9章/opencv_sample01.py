import cv2
import os

cap  = cv2.VideoCapture(os.getcwd() + '/mov/mov01.mov')
width = cap.get(cv2.CAP_PROP_FRAME_WIDTH)
height = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
count = cap.get(cv2.CAP_PROP_FRAME_COUNT)
fps = cap.get(cv2.CAP_PROP_FPS)
print('画像幅: ' + str(width))
print('画像高さ: ' + str(height))
print('総フレーム数: ' + str(count))
print('FPS: ' + str(fps))

while(cap.isOpened()):
    ret, frame = cap.read()
    if ret:
        cv2.imshow('frame', frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
cap.release()
cv2.destroyAllWindows()