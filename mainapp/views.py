from django.shortcuts import render,redirect
import urllib.request
import urllib.parse
import random 
import ssl
from django.contrib import messages
from django.core.mail import send_mail
from django.conf import settings
from mainapp.models import *

# Create your views here.
def sendSMS(user, otp, mobile):
    data = urllib.parse.urlencode({
        'username': 'Codebook',
        'apikey': '56dbbdc9cea86b276f6c',
        'mobile': mobile,
        'message': f'Hello {user}, your OTP for account activation is {otp}. This message is generated from https://www.codebook.in server. Thank you',
        'senderid': 'CODEBK'
    })
    data = data.encode('utf-8')
    # Disable SSL certificate verification
    context = ssl._create_unverified_context()
    request = urllib.request.Request("https://smslogin.co/v3/api.php?")
    f = urllib.request.urlopen(request, data,context=context)
    return f.read()

def home(req):
    return render(req,'main/main_home.html')

def user_login(req):
    if req.method == 'POST':
        u_email = req.POST.get('email')
        u_password = req.POST.get('password')
        print( u_email,u_password)
        
        user_data = User.objects.get(Email = u_email)
        print(user_data)
        if user_data.Password == u_password:
            if user_data.Otp_Status == 'verified' and user_data.User_Status=='accepted':
                req.session['User_id'] = user_data.User_id
                messages.success(req, 'You are logged in..')
                user_data.No_Of_Times_Login += 1
                user_data.save()
                return redirect('user_dashboard')
            elif user_data.Otp_Status == 'verified' and user_data.User_Status=='pending':
                messages.info(req, 'Your Status is in pending')
                return redirect('user_login')
            else:
                messages.warning(req, 'verifyOTP...!')
                req.session['User_id'] = user_data.User_id
                return redirect('otp')
        else:
            messages.error(req, 'incorrect credentials...!')
            return redirect('user_login')
    return render(req,'main/main_user.html')

def admin(req):
    admin_name = 'admin'
    admin_pwd = 'admin'
    if req.method == 'POST':
        admin_n = req.POST.get('aemail')
        admin_p = req.POST.get('apassword')
        if (admin_n == admin_name and admin_p == admin_pwd):
            messages.success(req, 'You are logged in..')
            return redirect('admin_dashboard')
        else:
            messages.error(req, 'You are trying to loging with wrong details..')
            return redirect('admin')
    return render(req,'main/main_admin.html')
def about(req):
    return render(req,'main/main_about.html')

def contact(req):
    if req.method == 'POST':
        name = req.POST.get('name')
        contact = req.POST.get('PhoneNumber')
        email = req.POST.get('email')
        message = req.POST.get('message')
        User.objects.create( Name = name,Phone=contact,Email=email,Message=message)
        messages.success(req, 'Your message has been submitted successfully.')
        return redirect('contact') 
    return render(req,'main/main_contact.html')

def register(req):
    if req.method == 'POST':
        name = req.POST.get('fullname')
        age = req.POST.get('age')
        password = req.POST.get('pwd')
        phone = req.POST.get('phone')
        email = req.POST.get('email')
        address = req.POST. get('address')
        image = req.FILES['image']
        print(name,age,email,address,image,phone,password)
        number = random.randint(1000,9999)
        print(number)
        try:
            data = User.objects.get(Email = email)
            return redirect('register')
        except:
            sendSMS(name,number,phone)
            User.objects.create(Name=name, Age=age,Password=password,Phone=phone,Email=email, Address =address,Image=image,Otp_Num = number)
            req.session['Email'] = email
            return redirect('otp')
    return render(req,'main/main_register.html')

def otp(req):
    user_email = req.session['Email']
    user_o = User.objects.get(Email = user_email)
    print(user_o.Otp_Num,'data otp')
    if req.method == 'POST':
        user_otp = req.POST.get('otp')
        u_otp = int(user_otp)
        if u_otp == user_o.Otp_Num:
            user_o.Otp_Status = 'verified'
            user_o.save()
            messages.success(req, 'OTP verification was Success. Now you can continue to login..!')
            return redirect('home')
        else:
            messages.error(req, 'OTP verification was Faild. You entered invalid OTP..!')
            return redirect('otp')
    return render(req,'main/main_otp.html')


def forgot(req):
    return render(req,'main/main_forgotpassword.html')

