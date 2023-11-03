# Generated by Django 4.2.5 on 2023-10-04 06:09

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('User_id', models.AutoField(primary_key=True, serialize=False)),
                ('Name', models.CharField(max_length=100)),
                ('Age', models.IntegerField(null=True)),
                ('Email', models.EmailField(max_length=100, null=True)),
                ('Password', models.TextField(max_length=100, null=True)),
                ('Address', models.TextField(max_length=100, null=True)),
                ('Phone', models.TextField(max_length=10, null=True)),
            ],
            options={
                'db_table': 'user',
            },
        ),
    ]
