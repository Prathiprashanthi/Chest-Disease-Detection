# Generated by Django 4.2.5 on 2023-10-05 10:17

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='manage_users_model',
            fields=[
                ('User_id', models.AutoField(primary_key=True, serialize=False)),
                ('user_Profile', models.FileField(upload_to='images/')),
                ('User_Email', models.EmailField(max_length=50)),
                ('User_Status', models.CharField(max_length=10)),
            ],
            options={
                'db_table': 'manage_users',
            },
        ),
    ]
