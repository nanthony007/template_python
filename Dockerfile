# Pull official python image
FROM tiangolo/uvicorn-gunicorn:python3.8

# Declare maintainer of container
LABEL NickAnthony nanthony007@gmail.com

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy requirements file
COPY pyproject.toml poetry.lock /usr/src/app/

# Install the dependencies.
RUN poetry install --no-root --no-dev

# Copy the current directory contents into the container at
COPY . /usr/src/app

# Run application on uvicorn server on dynamic port assigned by heroku
CMD uvicorn main:app --host=0.0.0.0 --port=${PORT:-5000}