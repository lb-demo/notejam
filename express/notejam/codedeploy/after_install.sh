  
#!/bin/bash

# This script is executed after the source is copied to the instances
cp /tmp/ecosystem.config.js /usr/share/notejam/
cd /usr/share/notejam && node db.js
