#!/bin/bash
sudo apt install python3-pip python3-dev python3.8-venv -y
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv django virtualenv
set_add="/home/ubuntu/code_pipeline_lightsail_django_test"
pip3 install django gunicorn


