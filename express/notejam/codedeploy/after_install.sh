  
#!/bin/bash

# This script is executed after the source is copied to the instances

echo -n "DB_HOST=" > /usr/share/notejam/.env
cat /home/ec2-user/endpoint.txt >> /usr/share/notejam/.env
echo "" >> /usr/share/notejam/.env
echo -n "DB_PASSWORD=" >> /usr/share/notejam/.env
aws --region=eu-west-2 ssm get-parameter --name "/Notejam/Database/DBPassword" --with-decryption --output text --query Parameter.Value >> /usr/share/notejam/.
env
echo -n "DB_USERNAME=" >> /usr/share/notejam/.env
aws --region=eu-west-2 ssm get-parameter --name "/Notejam/Database/DBUser" --with-decryption --output text --query Parameter.Value >> /usr/share/notejam/.env
echo -n "DB_NAME=" >> /usr/share/notejam/.env
aws --region=eu-west-2 ssm get-parameter --name "/Notejam/Database/DBName" --with-decryption --output text --query Parameter.Value >> /usr/share/notejam/.env

cp /tmp/ecosystem.config.js /usr/share/notejam/
cd /usr/share/notejam && node db.js
