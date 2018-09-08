FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
RUN mkdir /config
ADD /requirements.pip /config/
RUN pip install -r /config/requirements.pip
COPY . .
EXPOSE 8000
CMD ['py', 'manage.py', 'runserver']