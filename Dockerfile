# Use the official Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /django-api

# Update runtime and install pipenv
RUN apt-get update && apt-get install -y python3-pip libpq-dev gcc && pip3 install pipenv 

# Copy the requirements file into the container
COPY Pipfile* .

# Install the dependencies
RUN pipenv install

# Copy the app files into the container
COPY . .

# Run migrations
RUN pipenv run python app/manage.py migrate

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["pipenv","run","python", "app/manage.py","runserver","0.0.0.0:8000"]
