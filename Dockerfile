FROM python:3.12-slim

WORKDIR /app

# Copy dependency definition first for Docker layer caching
COPY requirements.txt .

# Install dependencies directly into the container's system Python
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files (run.py, templates, etc.)
COPY . .

EXPOSE 5000

CMD ["flask", "--app", "run", "run", "--host=0.0.0.0", "--port=5000"]