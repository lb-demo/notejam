#!/bin/bash

# This will stop notejam
cd /usr/share/notejam
pm2 stop notejam || true
