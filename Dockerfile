############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

# Copy needed app files
WORKDIR $GOPATH/src/gemigit/
COPY . .

# Fetch dependencies.
# Using go get.
RUN go get -d -v

# Build the binary.
RUN go build -o /app/gemigit

############################
# STEP 2 build a small image
############################
FROM alpine AS gemigit

# Copy static executable.
WORKDIR /app
COPY --from=builder /app/gemigit ./gemigit
COPY . .

# Install git
RUN apk add git

# Set application to listen on indicated ports
EXPOSE 1965
EXPOSE 5555

# Start command
ENTRYPOINT ["/app/gemigit"]