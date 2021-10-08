#!/bin/bash
set_add="/home/ubuntu/code_pipeline_lightsail_django_test/"
cat $set_add/scripts/gunicorn.socket > /etc/systemd/system/gunicorn.service
cat $set_add/scripts/gunicorn.service > /etc/systemd/system/gunicorn.service

sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket

touch /etc/nginx/sites-available/hello
cat $set_add/scripts/nginx >> /etc/nginx/sites-available/hello

sudo ln -s /etc/nginx/sites-available/hello /etc/nginx/sites-enabled
sudo systemctl restart nginx
sudo ufw allow 'Nginx Full'