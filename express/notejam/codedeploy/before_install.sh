#!/bin/bash

# This script is executed before copying the source code

pm2 update

export app_root=/usr/share/notejam
if [ -d "$app_root" ];then
    rm -rf /usr/share/notejam
    mkdir -p /usr/share/notejam
else
    mkdir -p /usr/share/notejam
fi
