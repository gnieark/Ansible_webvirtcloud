#!/bin/bash
virtualenv venv
source venv/bin/activate
pip install -r conf/requirements.txt
python manage.py migrate