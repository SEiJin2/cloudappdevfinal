from django.apps import AppConfig

# This is the configuration class for the restapi app
# Only 1 app is registered in this project

class restapiConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'restapi'
