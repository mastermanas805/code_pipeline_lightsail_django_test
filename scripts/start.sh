#!/bin/bash
sudo echo "
[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/code_pipeline_lightsail_django_test
ExecStart=/home/sammy/code_pipeline_lightsail_django_test/venv/bin/gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/gunicorn.sock \
          hello.wsgi:application

[Install]
WantedBy=multi-user.target
" 
> /etc/systemd/system/gunicorn.service

sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket

sudo echo 
"
server {
    listen 80;
    server_name 35.154.218.78;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/ubuntu/code_pipeline_lightsail_django_test;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/run/gunicorn.sock;
    }
}
" 
> /etc/nginx/sites-available/hello

sudo ln -s /etc/nginx/sites-available/hello /etc/nginx/sites-enabled
sudo systemctl restart nginx
sudo ufw allow 'Nginx Full'