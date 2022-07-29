FROM python:3.8-slim-buster
LABEL maintainer="cure4itches@gmail.com"
LABEL description="This is a simple flask webapp that prints 'HOSTNAME' envvar."
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
EXPOSE 5000
ENTRYPOINT [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]