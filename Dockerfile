# Use the official NGINX image as the base image
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /app

COPY code /app

# Remove the default NGINX HTML directory and create a symbolic link
RUN rm -rf /usr/share/nginx/html && ln -s /app /usr/share/nginx/html

# Allow users to change the port via environment variables (implemented in entrypoint.sh)
ARG PORT=80
ENV PORT=${3000}

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set execute permissions for the entrypoint script
RUN chmod +x /entrypoint.sh

# Expose the port NGINX will use
EXPOSE ${80}

