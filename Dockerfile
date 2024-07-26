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
