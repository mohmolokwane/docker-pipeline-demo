# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install required system packages
RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*

# Install pip packages
COPY app/requirements.txt .
RUN pip install -r requirements.txt

# Copy the current directory contents into the container
COPY . .

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
