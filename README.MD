Here’s a step-by-step guide to create Docker images and push them to Docker Hub:

### Step 1: Install Docker
1. **Windows/Mac:**
   - Download Docker Desktop from [Docker's official site](https://www.docker.com/products/docker-desktop).
   - Install Docker Desktop and start it.

2. **Linux:**
   - Follow the installation instructions from [Docker's official site](https://docs.docker.com/engine/install/).
   ```
   sudo apt install docker.io
   ```

### Step 2: Create a Dockerfile
1. **Navigate to your project directory:**
   ```bash
   cd cncf-kathmandu
   ```

2. **Create a `Dockerfile`:**
   ```Dockerfile
   # Use an official Go runtime as a parent image
   FROM golang:1.16

   # Set the working directory inside the container
   WORKDIR /app

   # Copy the current directory contents into the container at /app
   COPY . .

   # Build the Go app
   RUN go build -o main .

   # Make port 8080 available to the world outside this container
   EXPOSE 8080

   # Run the executable
   CMD ["./main"]
   ```

### Step 3: Build the Docker Image
1. **Build your Docker image:**
   ```bash
   docker build -t todoapp:v1 .
   ```

### Step 4: Run the Docker Image Locally (Optional)
1. **Run your Docker image to test it:**
  
   ```bash
   docker run -d -p 8080:8000 todoapp:v1
   ```

### Step 5: Create a Docker Hub Account
1. **Sign up at [Docker Hub](https://hub.docker.com/signup).**
2. **Log in to Docker Hub:**
   ```bash
   docker login
   ```
   Enter your Docker Hub username and password when prompted.

### Step 6: Push the Docker Image to Docker Hub
1. **Push your Docker image:**
   ```bash
   docker tag todoapp:v1 anish60/demo-app:v1
   ```
   
   ```bash
   docker push anish60/demo-app:v1
   ```

### Step 7: Verify the Docker Image on Docker Hub
1. **Go to your Docker Hub account.**
2. **Navigate to the repository to verify the image has been pushed.**

