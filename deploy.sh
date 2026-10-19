#!/bin/bash

# Copy the site into nginx's folder
sudo cp index.html /var/www/html/index.html

# Restart nginx so it picks up changes
sudo systemctl restart nginx

# Ask the site for its status code
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

# Check the answer
if [ "$STATUS" = "200" ]; then
  echo "Site is UP"
else
  echo "Site is DOWN (status $STATUS)"
fi
