#python image
FROM python:3.7-alpine

#set the working dir to /code
WORKDIR /code

#set env varibales used by flask command
ENV FLASK_App=app.py
ENV FLASK_RUN_HOST=0.0.0.0

#install gcc and other dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

#copy requirements.txt. and install python dependencies
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt
EXPOSE 5000

#copy current project dir .  to working directory
COPY . .

#set cmd to run the flask
CMD ["flask", "run"]
