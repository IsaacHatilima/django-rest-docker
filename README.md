# django-rest-docker
# Commands to run in terminal

RUN: docker build -t appname .

THEN: docker run -d -p 8000:8000 -t appname

# In Docker desktop makesure to add port.