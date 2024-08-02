# Linux NameSpaces

```
docker run nginx --image nginx 

```
### Check all the process running in your OS  and filter out nginx process 

```
ps -ef | grep nginx 
```

### Check the linux namspaces 

``` 
lsns -p <process-id>
```

# Here’s a step-by-step guide to create Docker images and push them to Docker Hub:

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
# Stage 1: Build (Golang environment)
FROM golang:alpine AS builder

WORKDIR /app

# Efficient dependency management with go mod cache
COPY go.mod ./
RUN go mod download

# Copy your Go source code
COPY . .

# Build the application binary (replace 'your-app' with your actual binary name)
RUN go build -o your-app .

# Stage 2: Production (Minimal alpine image)
FROM alpine:latest

# Copy only the application binary from the builder stage
COPY --from=builder /app/your-app /app/your-app

# Set the working directory for the application
WORKDIR /app

# Expose the port your application listens on (replace 8080 with your actual port)
EXPOSE 8000

# Command to run the application
CMD ["/app/your-app"]
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

