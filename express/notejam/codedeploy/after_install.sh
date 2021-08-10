  
#!/bin/bash

# This script is executed after the source is copied to the instances

EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed 's/[a-z]$//'`"

echo -n "DB_HOST=" > /usr/share/notejam/.env
cat /home/ec2-user/endpoint.txt >> /usr/share/notejam/.env
echo "" >> /usr/share/notejam/.env
echo -n "DB_PASSWORD=" >> /usr/share/notejam/.env
aws --region=$EC2_REGION ssm get-parameter --name "/Notejam/Database/DBPassword" --with-decryption --output text --query Parameter.Value >> /usr/share/notejam
/.env
echo -n "DB_USERNAME=" >> /usr/share/notejam/.env
aws --region=$EC2_REGION ssm get-parameter --name "/Notejam/Database/DBUser" --with-decryption --output text --query Parameter.Value >> /usr/share/notejam/.en
v
echo -n "DB_NAME=" >> /usr/share/notejam/.env
aws --region=$EC2_REGION ssm get-parameter --name "/Notejam/Database/DBName" --with-decryption --output text --query Parameter.Value >> /usr/share/notejam/.en
v

cp /tmp/ecosystem.config.js /usr/share/notejam/
cd /usr/share/notejam && node db.js
