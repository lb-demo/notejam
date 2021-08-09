#!/bin/bash

# This script will start notejam
cd /usr/share/notejam
pm2 start /usr/share/notejam/ecosystem.config.js -i 0 --name "notejam"
