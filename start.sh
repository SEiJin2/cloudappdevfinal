#!/bin/bash

cd bin

export DJANGO_SETTINGS_MODULE="backend.settings"


python manage.py migrate --noinput
python manage.py collectstatic --noinput
gunicorn backend.wsgi:application --timeout 200 --log-level=debug --bind 0.0.0.0:8000

