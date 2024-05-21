# Use the official Python image from the Docker Hub.
FROM python:3.9-slim

# Set environment variables to prevent Python from writing .pyc files to disk
# and to ensure that Python output is sent straight to the terminal (stdout).
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container.
WORKDIR /app

# Copy the requirements file into the container at /app.
COPY requirements.txt /app/

# Install any necessary dependencies specified in requirements.txt.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app.
COPY . /app

# Specify the command to run the application.
CMD ["flask", "run", "--host=0.0.0.0"]
