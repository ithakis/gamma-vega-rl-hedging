# Use an official Python base image compatible with x86 architecture
FROM --platform=linux/amd64 python:3.9

# Set a working directory
WORKDIR /app

# Install system dependencies (if any are needed, adjust as necessary)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy local code to the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir --default-timeout=100 -r requirements.txt

# This command depends on how you want to run your project; adjust as necessary
# For example, if it's a script:
# CMD ["python", "your_script.py"]
# If you use Jupyter:
CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]
