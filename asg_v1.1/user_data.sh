#!/bin/bash
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo echo "Hello from ${environment} Instance" >> /var/www/html/index.html