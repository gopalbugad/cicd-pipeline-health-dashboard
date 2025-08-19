FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Default command
CMD ["nginx", "-g", "daemon off;"]
