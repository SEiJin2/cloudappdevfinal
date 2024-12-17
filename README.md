# Django Application

Welcome to the Django Application! This guide will walk you through setting up and running the project.

## Prerequisites

Make sure you have the following installed on your system:

- Python (version 3.9 or higher, for local setup. This project was implemented in python 3.12.0)
- pip (Python package manager, for local setup. This project was implemented in pip 23.2.1)
- virtualenv (optional, but recommended, for local setup)
- Docker (for Docker-based setup)

## Local Setup

To set up the project locally, follow these steps:

### 1. Clone the Repository

To get a copy of the code, run the following command:

```bash
git clone #pastelinkhere
cd oleg_cloudapp_final
```

### 2. Set Up a Virtual Environment

Create and activate a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Requirements

Install the dependencies listed in the `requirements.txt` file:

```bash
python -m pip install -r requirements.txt
```

### 4. Run Migrations

Apply database migrations to set up the database schema:

```bash
python manage.py migrate
```

### 5. Run the Development Server

Start the Django development server:

```bash
python manage.py runserver
```

The application will be accessible at `http://127.0.0.1:8000`.


Here’s an updated version of your README file, including instructions on working with Docker to run your Django project:

---

## Docker Setup

Follow these steps to build and run the project using Docker.

### 1. Build the Docker Image

In the project root directory (where the `Dockerfile` is located), build the Docker image:

```bash
docker build -t django-app .
```

### 2. Run the Docker Container

Run the container and expose the application on port 8000:

```bash
docker run -p 8000:8000 django-app
```

### 3. Access the Application

The application will be accessible at `http://127.0.0.1:8000`.

---

## Notes on Docker

- The `Dockerfile` in this project sets up the environment, installs dependencies, and prepares the Django application for production using Gunicorn as the WSGI server.
- The `start.sh` script handles the following:
  1. Migrating the database (`python manage.py migrate`).
  2. Collecting static files (`python manage.py collectstatic`).
  3. Starting the application using Gunicorn.

---

## Running Management Commands Inside Docker

To execute Django management commands within the Docker container, use the following format:

```bash
docker exec -it <container_id_or_name> python manage.py <command>
```

For example, to create a superuser:

```bash
docker exec -it django-app-container python manage.py createsuperuser
```

Replace `<container_id_or_name>` with the actual container ID or name.

