# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9-alpine3.13
LABEL maintainer="isaachatilima@gmail.com"
EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Coppy Files
# Upgrade pip and install deps
# migrate and collect static files
# create and switch to user

WORKDIR /app
COPY . /app

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    python manage.py migrate && \
    python manage.py collectstatic --no-input && \
    adduser --disabled-password --no-create-home app_user

USER app_user


CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi"]
