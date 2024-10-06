# Use Red Hat Universal Base Image 9
FROM registry.access.redhat.com/ubi9/python-39

# Set the working directory
WORKDIR /app

# Copy the source code
COPY src/ /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]
