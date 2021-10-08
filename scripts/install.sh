#!/bin/bash
sudo apt install python3-pip python3-dev -y
sudo -H pip3 install virtualenv django
sudo cd /home/ubuntu/code_pipeline_lightsail_django_test && sudo python3 -m venv venv && sudo pip3 install django gunicorn




