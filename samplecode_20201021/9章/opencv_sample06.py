import cv2
import os


print('タイムラプスの生成を開始します')
cap  = cv2.VideoCapture(os.getcwd() + '/mov/mov01.mov')
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

hog = cv2.HOGDescriptor()
hog.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())
hogParams = {'winStride': (8,8), 'padding': (32,32), 'scale': 1.05, 'hitThreshold': 0}

movie_name = 'timelapse.mov'
fourcc = cv2.VideoWriter_fourcc('X', 'V', 'I', 'D')
video = cv2.VideoWriter(movie_name, fourcc, 30, (width, height))

num = 0
while(cap.isOpened()):
    ret, frame = cap.read()
    if ret:
        if (num % 10 ==0):
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            human,r = hog.detectMultiScale(gray, **hogParams)
            if  (len(human) >0):
                for (x, y, w, h) in human:
                    cv2.rectangle(frame, (x,y), (x +w, y+h), (255,255,255), 3)
            video.write(frame)
    else:
        break
    print(f'done: {num}')
    num = num + 1
video.release()
cap.release()
cv2.destroyAllWindows()
print('タイムラプスの生成を終了します')