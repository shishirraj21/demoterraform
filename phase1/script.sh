#!/bin/bash
apt-get update
apt-get install nginx -y
echo "Test Deployment-1" >/var/www/html/index.html