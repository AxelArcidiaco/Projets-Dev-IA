from flask import Flask
from fbapp.view import app
from fbapp import models

# Connect sqlalchemy to app
models.db.init_app(app)