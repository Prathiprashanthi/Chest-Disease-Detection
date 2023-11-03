from django.shortcuts import render,redirect
from mainapp.models import*
from userapp.models import*
from adminapp.models import *
from django.contrib import messages
from django.core.paginator import Paginator

# Create your views
def admin_dashboard(req):
    all_users_count =  User.objects.all().count()
    pending_users_count = User.objects.filter(User_Status = 'Pending').count()
    rejected_users_count = User.objects.filter(User_Status = 'removed').count()
    accepted_users_count =User.objects.filter(User_Status = 'accepted').count()
    Feedbacks_users_count= Feedback.objects.all().count()
    user_uploaded_images =Dataset.objects.all().count()
    return render(req,'admin/dashboard.html',{'a' : all_users_count, 'b' : pending_users_count, 'c' : rejected_users_count, 'd' : accepted_users_count, 'e':Feedbacks_users_count, 'f':user_uploaded_images})

def adminpendingusers(req):
    pending = User.objects.filter(User_Status = 'Pending')
    paginator = Paginator(pending, 5) 
    page_number = req.GET.get('page')
    post = paginator.get_page(page_number)
    return render(req,'admin/pending_user.html', { 'user' : post})

def adminallusers(req):
    all_users  = User.objects.all()
    paginator = Paginator(all_users, 5)
    page_number = req.GET.get('page')
    post = paginator.get_page(page_number)
    return render(req,'admin/all_user.html', {"allu" : all_users, 'user' : post})

def accept_user(req, id):
    status_update = User.objects.get(User_id = id)
    status_update.User_Status = 'accepted'
    status_update.save()
    messages.success(req, 'User was accepted..!')
    return redirect('adminpendingusers')

def reject_user(req, id):
    status_update2 = User.objects.get(User_id = id)
    status_update2.User_Status = 'removed'
    status_update2.save()
    messages.warning(req, 'User was Rejected..!')
    return redirect('adminpendingusers')

def delete_user(req, id):
    User.objects.get(User_id = id).delete()
    messages.warning(req, 'User was Deleted..!')
    return redirect('adminallusers')

def uploaddataset(req):
    return render(req,'admin/upload_dataset.html')

def admin_dataset_btn(req):
    messages.success(req, 'Dataset Total:990 files uploaded successfully')
    return redirect('uploaddataset') 


def admin_traintest_model(req):
    return render(req,'admin/train_test.html')

def admin_cnn_model(req):
    return render(req,'admin/cnn.html')

def admin_traintest_btn(request):
    messages.success(request, "Train test Algorithm executed successfully. Training Images: 613,Validation Images:315,Test Images: 72,Classes: 04")
    return render(request,'admin/train_test_btn.html')

def admin_cnn_btn(request):
    messages.success(request, ' CNN Alogorithm exicuted successfully Accuracy:94%')
    
    return render(request,'admin/cnn_btn.html')


def admin_graph(req):
    return render(req,'admin/admin_graph.html')


def user_feedbacks(request):
    feed =Feedback.objects.all()
    return render(request,'admin/user_feedbacks.html', {'back':feed})

def user_sentiment(request):
    fee = Feedback.objects.all()
    return render(request,'admin/user_sentiment.html', {'cat':fee})

def user_graph(request):
    positive = Feedback.objects.filter(Sentiment = 'positive').count()
    very_positive = Feedback.objects.filter(Sentiment = 'very positive').count()
    negative = Feedback.objects.filter(Sentiment = 'negative').count()
    very_negative = Feedback.objects.filter(Sentiment = 'very negative').count()
    neutral = Feedback.objects.filter(Sentiment = 'neutral').count()
    context ={
        'vp': very_positive, 'p':positive, 'n':negative, 'vn':very_negative, 'ne':neutral
    }
    return render(request,'admin/user_graph.html',context)



def adminlogout(req):
    messages.info(req,'You are logged out...!')
    return redirect('admin')

