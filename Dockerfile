# Pull official python image
FROM tiangolo/uvicorn-gunicorn:python3.8

# Declare maintainer of container
LABEL NickAnthony nanthony007@gmail.com

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Copy requirements file
COPY ./requirements.txt /usr/src/app/requirements.txt

# Install the dependencies.
RUN pip3 install -r /usr/src/app/requirements.txt

# Copy the current directory contents into the container at
COPY . /usr/src/app

# Run application on uvicorn server on dynamic port assigned by heroku
CMD uvicorn main:app --host=0.0.0.0 --port=${PORT:-5000}