# Use the official Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Create the HTML file
RUN echo '<!DOCTYPE html><html><head><title>Web Server</title></head><body><h1>hello to you</h1></body></html>' > /app/index.html

# Install the required Python module for the HTTP server
RUN pip install flask

# Copy a simple Flask app
RUN echo 'from flask import Flask, send_from_directory\napp = Flask(__name__)\n@app.route("/")\ndef serve():\n    return send_from_directory(".", "index.html")\n\nif __name__ == "__main__":\n    app.run(host="0.0.0.0", port=80)' > /app/app.py

# Expose port 80
EXPOSE 80

# Set the command to start the web server
CMD ["python", "app.py"]

