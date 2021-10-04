#!/bin/bash
log=log.txt

python3 manage.py runserver 0.0.0.0:8000 >> $log
