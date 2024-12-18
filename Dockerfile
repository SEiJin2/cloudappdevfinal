FROM python:3.9

# Set the working directory
WORKDIR /code

# Install dos2unix
RUN apt-get update && apt-get install -y dos2unix

# Copy the requirements file and install dependencies
COPY requirements.txt /code/
RUN pip3 install -r /code/requirements.txt

# Copy the rest of the application code
COPY . /code/

# Copy the start.sh script to the root directory
COPY start.sh /start.sh

# Convert line endings and make the script executable
RUN dos2unix /start.sh && chmod +x /start.sh

# Set the working directory to /code and run the start.sh script
CMD ["/bin/bash", "-c", "cd /code && /start.sh"]