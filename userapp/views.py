from django.shortcuts import render,redirect
from  userapp.session import session_required
from mainapp.models import *
from userapp.models import *
from adminapp.models import *
from django.contrib import messages
import time
from django.core.paginator import Paginator
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
from django.core.files.storage import default_storage
from django.conf import settings
from django.contrib.auth import login
from django.utils import timezone
import pytz
from datetime import datetime
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.inception_v3 import preprocess_input
# Create your views here.

@session_required
def user_dashboard(request):
    images_count =  User.objects.all().count()
    print(images_count)
    user_id = request.session["User_id"]
    user = User.objects.get(User_id = user_id)
    
    if user.Last_Login_Time is None:
        IST = pytz.timezone('Asia/Kolkata')
        current_time_ist = datetime.now(IST).time()
        user.Last_Login_Time = current_time_ist
        user.save()
    
    return render(request,'user/user_dashboard.html', {'detect' : images_count, 'la' : user})


@session_required
def user_profile(request):
    user_id = request.session["User_id"]
    user = User.objects.get(User_id = user_id)
    if request.method == 'POST':
        user_name = request.POST.get('name')
        user_age = request.POST.get('age')
        user_phone = request.POST.get('phone')
        user_email = request.POST.get('email')
        user_address = request.POST.get("address")
        
        user.Name = user_name
        user.Age = user_age
        user.Address = user_address
        user.Phone = user_phone
        user.Email=user_email
       

        if len(request.FILES) != 0:
            image = request.FILES['profilepic']
            user.Image = image
            user.Name = user_name
            user.Age = user_age
            user.Address = user_address
            user.Phone = user_phone
            user.Email=user_email
            user.Address=user_address
            
            user.save()
            messages.success(request, 'Updated SUccessfully...!')
        else:
            user. Name = user_name
            user.Age = user_age
            user.save()
            messages.success(request, 'Updated SUccessfully...!')
            
    context = {"i":user}
    return render(request,'user/user_profile.html',context)



model = load_model('chest_cancer\model_chest.h5')

ref={
    0:'adenocarcinoma',
    1:'large-cell-carcinoma',
    2:'normal',
    3:'squamous-cell-carcinoma'
}
def prediction(path):
  img = image.load_img(path, target_size=(224, 224))
  i = image.img_to_array(img)
  i = np.expand_dims(i, axis=0)
  img = preprocess_input(i)
  pred = np.argmax(model.predict(img), axis=1)
  return ref[pred[0]]

@session_required
def user_detecetd(request):
    result = {"message": "No image uploaded"}  # Initialize the result as a dictionary
    uploaded_image_url = None

    if request.method == "POST" and 'img' in request.FILES:
        uploaded_image = request.FILES['img']
        Dataset.objects.create(Image= uploaded_image)
        file_path = default_storage.save(uploaded_image.name, uploaded_image)
        path = settings.MEDIA_ROOT + '/' + file_path
        uploaded_image_url = default_storage.url(file_path)
        result = prediction(path)  # Assuming prediction() returns a dictionary
        request.session['result'] = result
        request.session['uploaded_image_url']=uploaded_image_url
        messages.success(request,'Uploaded image successfully')
        return redirect('user_result')
    
    return render(request,'user/user_imagedetection.html', {'result': result, 'uploaded_image_url': uploaded_image_url})

def user_result(request):
    result = request.session.get('result', {"message": "No result available"})
    uploaded_image_url = request.session.get('uploaded_image_url', None)
    messages.success(request,'Detected Chest disease')# Provide a default value (None 
    return render(request,'user/user_result.html', {'result': result, 'uploaded_image_url': uploaded_image_url})

@session_required
def user_feedback(request):
    id=request.session["User_id"]
    uusser=User.objects.get(User_id=id)
    if request.method == "POST":
        rating=request.POST.get("rating")
        review=request.POST.get("review")
        # print(sentiment)        
        # print(rating,feed)
        sid=SentimentIntensityAnalyzer()
        score=sid.polarity_scores(review)
        sentiment=None
        if score['compound']>0 and score['compound']<=0.5:
            sentiment='positive'
        elif score['compound']>=0.5:
            sentiment='very positive'
        elif score['compound']<-0.5:
            sentiment='very negative'
        elif score['compound']<0 and score['compound']>=-0.5:
            sentiment='negative'
        else :
            sentiment='neutral'
        Feedback.objects.create(Rating=rating, Review=review,Sentiment=sentiment, Reviewer=uusser)
        messages.success(request,'Feedback recorded')
        return redirect('user_feedback')
    return render(request,'user/user_feedback.html')
@session_required
def userlogout(request):
    user_id = request.session["User_id"]
    user = User.objects.get(User_id = user_id) 
    t = time.localtime()
    user.Last_Login_Time = t
    current_time = time.strftime('%H:%M:%S', t)
    user.Last_Login_Time = current_time
    current_date = time.strftime('%Y-%m-%d')
    user.Last_Login_Date = current_date
    user.save()
    messages.info(request, 'You are logged out..')
    return redirect('user_login')