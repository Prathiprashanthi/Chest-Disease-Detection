"""
URL configuration for chestproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as main_views
from userapp import views as user_views
from adminapp import views as admin_views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    #main_views
    path('admin/', admin.site.urls),
    path('',main_views.home,name='home'),
    path('user_login',main_views.user_login,name='user_login'),
    path('admin',main_views.admin,name='admin'),
    path('about',main_views.about,name='about'),
    path('contact',main_views.contact,name='contact'),
    path('register',main_views.register,name='register'),
    path('otp',main_views.otp,name='otp'),
    path('forgot',main_views.forgot,name='forgot'),
    #user_views
    path('user_dashboard',user_views.user_dashboard,name='user_dashboard'),
    path('user_profile',user_views.user_profile,name='user_profile'),
    path('user_detected',user_views.user_detecetd,name='user_detected'),
    path('user_feedback',user_views.user_feedback,name='user_feedback'),
    path('userlogout',user_views.userlogout, name = 'userlogout'),
    path('user_result',user_views.user_result, name ='user_result'),
    
    #admin_views
    path('admin_dashboard',admin_views.admin_dashboard,name='admin_dashboard'),
    path('adminpendingusers',admin_views.adminpendingusers, name="adminpendingusers"),
    path('adminallusers',admin_views.adminallusers,name='adminallusers'),
    path('accept-user/<int:id>', admin_views.accept_user, name = 'accept_user'),
    path('reject-user/<int:id>', admin_views.reject_user, name = 'reject'),
    path('delete-user/<int:id>', admin_views.delete_user, name = 'delete_user'),
    path('uploaddataset',admin_views.uploaddataset,name='uploaddataset'),
    path('admin_traintest_model',admin_views.admin_traintest_model,name='admin_traintest_model'),
    path('admin_cnn_model',admin_views.admin_cnn_model,name='admin_cnn_model'),
    path('admin_traintest_btn',admin_views.admin_traintest_btn,name='admin_traintest_btn'),
    path('admin_graph',admin_views.admin_graph,name='admin_graph'),
    path('admin_cnn_btn',admin_views.admin_cnn_btn,name='admin_cnn_btn'),
    path('user_feedbacks',admin_views.user_feedbacks,name='user_feedbacks'),
    path('user_sentiment',admin_views.user_sentiment,name='user_sentiment'),
    path('user_graph',admin_views.user_graph,name='user_graph'),
    path('admin_dataset_btn',admin_views.admin_dataset_btn,name='admin_dataset_btn'),
    path('adminlogout',admin_views.adminlogout, name='adminlogout'),
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
