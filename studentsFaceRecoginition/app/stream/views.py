from datetime import datetime
import os
from django.shortcuts import render
from django.http import StreamingHttpResponse
import  time
import  numpy as np
import face_recognition
import cv2
import pickle
from playsound import playsound
from .models import Recognition, Stranger,Students
from threading import Thread
# from  simple_facerec import  SimpleFacerec
# Create your views here.

dayNow = datetime.now().date()
#List khuôn mặt đã nhận diện

idStdToday = []
strangerToday=[]

#Tiền xử lí ảnh
def imgPreprocess():
    folder_in = "stream/DataRaw"
    folder_out = "stream/DataTrain"
    folder_out2 = "stream/static"
    myList = os.listdir(folder_in)
    for item in myList:
        curentImg = cv2.imread(f"{folder_in}/{item}")
        curentImgRGB = cv2.cvtColor(curentImg, cv2.COLOR_BGR2RGB)
        faceloc = face_recognition.face_locations(curentImgRGB)
        top, right, bottom, left = faceloc[0]
        # sub_face = curentImg[top - 5 :bottom + 5,left -5 :right + 5]
        sub_face = curentImg[top :bottom ,left :right ]
        sub_faceRGB = curentImgRGB[top :bottom ,left :right ]
        imagename = os.path.splitext(item)[0] + ".jpg"
        file_path = folder_out + "/" + imagename
        file_path2 = folder_out2 + "/" + imagename
        cv2.imwrite(file_path, sub_faceRGB)
        cv2.imwrite(file_path2, sub_face)
        print(f"Process: {imagename}")
    print("Finished Image process!!")

all_face_encodings=[]
face_names=[]
encodeListKnow=[]
# encode ảnh và lưu vào file
def saveEncodeToFile():
    path = "stream/DataTrain"
    images = []
    className =[]
    myList = os.listdir(path)
    for item in myList:
        curentImg = cv2.imread(f"{path}/{item}")
        images.append(curentImg)
        className.append(os.path.splitext(item)[0])

    all_face_encodings={}
    for imgname,img in zip(className,images):
        all_face_encodings[imgname] = face_recognition.face_encodings(img)[0]
        print(f"Encode: {imgname}")
    with open('dataset_faces.dat', 'wb') as f:
        pickle.dump(all_face_encodings, f)
    print("Finished encoding!!")

def LoadFaceDataFile():
    kq = os.stat("dataset_faces.dat").st_size
    if kq == 0:
        imgPreprocess()
        saveEncodeToFile()
    return

LoadFaceDataFile()
def getStdIdToArr():
    idStdToday.clear()
    stdRecog = Recognition.objects.raw("SELECT id,tbl_recognition.students_id as studentId FROM `tbl_recognition` WHERE tbl_recognition.date=CURDATE()") 
    for std in stdRecog:
        idStdToday.append(std.students_id)
def getStrangerToArr():
    strangerToday.clear()
    strangers = Recognition.objects.raw("SELECT id,imgName FROM `tbl_strangers` WHERE date=CURDATE()") 
    for stranger in strangers:
        strangerToday.append(stranger.imgName)


def getFaceNames():
    with open('dataset_faces.dat', 'rb') as f:
        all_face_encodings = pickle.load(f)
    face_names = list(all_face_encodings.keys())
    return face_names
def getEncodeListKnow():
    with open('dataset_faces.dat', 'rb') as f:
        all_face_encodings = pickle.load(f)
    encodeListKnow = np.array(list(all_face_encodings.values()))
    return encodeListKnow

face_names = getFaceNames()
encodeListKnow = getEncodeListKnow()

#Kiểm tra xem người này là sinh viên và đã đc nhận diện hôm nay chưa
def kiemtratontai(idImg):
    getStdIdToArr()
    allStudents = Students.objects.all()
    result = True
    result1 = False
    result2 = False
    for idToday in idStdToday:
        if idToday == idImg:
            result1 = True
            break
    for student in allStudents:
        if student.id == idImg:
            result2 = True
            break
    if result1==False and result2 ==True:
        result = False
    return result

def notificationSound():
    playsound('stream/Sound/nhacchuong.mp3')

cap = cv2.VideoCapture(0)
def recogProcess(frameS,frame,faceCurFrame):
        if(len(encodeListKnow!=0)):
            endcodeCurFrame = face_recognition.face_encodings(frameS,faceCurFrame)
            for faceloc,encodeFace in zip (faceCurFrame,endcodeCurFrame):
                faceDis = face_recognition.face_distance(encodeListKnow,encodeFace)
                matchIndex = np.argmin(faceDis)
                if faceDis[matchIndex] < 0.45 :
                    maSV = face_names[matchIndex]
                    print(maSV)
                    result = kiemtratontai(maSV)
                    if (result == False):
                        addStudent = Recognition(time='CURRENT_TIME()',students_id=f'{maSV}')
                        addStudent.save()
                        thread = Thread(target=notificationSound)
                        thread.start()
                else:
                    folder_out = "stream/static/Unknow"
                    Now = datetime.now()
                    strNow = Now.strftime("%d_%m_%Y_%H_%M_%S_%f")
                    top, right, bottom, left = faceloc
                    top, right, bottom, left = top*2, right*2, bottom*2, left*2
                    sub_face = frame[top :bottom ,left :right ]
                    imagename = strNow+".jpg"
                    file_path = folder_out + "/" + imagename
                    if(cv2.imwrite(file_path, sub_face)):
                        strangerToday.clear()
                        getStrangerToArr()
                        addStranger = Stranger(imgName=imagename)
                        addStranger.save()
                        print(f"Process: {imagename}")
        return
faceInFrame=[]
prev_frame_time = 0
new_frame_time = 0
def stream():
    count=0
    global faceInFrame
    global new_frame_time
    global prev_frame_time
    while True:   
        if count==10000:
            count=0
        count = count+1
        now = datetime.now()
        nowStr = now.strftime("%H:%M:%S")
        ret , frame = cap.read()
        if not ret:
            print("Error: Failed to capture image")
            break
            
        if count%5==0: 
            faceInFrame.clear()
        if count%3==0:
            frameHalf = cv2.resize(frame,dsize=None,fx=0.5,fy=0.5)
            frameS = cv2.cvtColor(frameHalf, cv2.COLOR_BGR2RGB)
            faceCurFrame = face_recognition.face_locations(frameS)
            for faceLoc in faceCurFrame:
                y1, x2, y2, x1 = faceLoc
                faceInFrame= faceCurFrame
        if(count%16==0):
            thread3 = Thread(target=recogProcess(frameS,frame,faceCurFrame))
            thread3.start()

        for faceloc in faceInFrame:
            y1, x2, y2, x1 = faceloc
            y1, x2, y2, x1 = y1 * 2, x2 * 2, y2 * 2, x1 * 2
            cv2.rectangle(frame, (x1, y1), (x2, y2),(0, 255, 0), 2)
        new_frame_time = time.time()  
        fps = 1/(new_frame_time-prev_frame_time)
        prev_frame_time = new_frame_time
        now = datetime.now()
        nowStr = now.strftime("%H:%M:%S")               
        cv2.putText(frame, f"{now.date()} {nowStr}",(15, 40) , cv2.FONT_ITALIC, 0.5,(255,0,0),1)
        cv2.putText(frame, f"Fps: {int(fps)}",(15, 60) , cv2.FONT_ITALIC, 0.5,(255,0,0),1)
        image_bytes = cv2.imencode('.jpg', frame)[1].tobytes()
        yield(b'--frame\r\n'
            b'Content-Type: image/jpeg\r\n\r\n' + image_bytes + b'\r\n')


def video_feed(request):
    return StreamingHttpResponse(stream(), content_type='multipart/x-mixed-replace; boundary=frame')
def home(request):

    stdToday = Students.objects.raw("SELECT tbl_students.id,tbl_students.fullName,tbl_students.address,tbl_students.classs_id,tbl_students.phoneNumber,tbl_recognition.date,tbl_recognition.time AS time FROM `tbl_students`,`tbl_recognition` WHERE tbl_students.id = tbl_recognition.students_id AND tbl_recognition.date=CURDATE()") 
    global face_names
    global encodeListKnow
    face_names = getFaceNames()
    encodeListKnow = getEncodeListKnow() 

    stgToday = Students.objects.raw("SELECT * FROM `tbl_strangers` WHERE date=CURRENT_DATE()") 

    return render(request,'index.html',{'stdToday':stdToday,'strangerToday':stgToday})