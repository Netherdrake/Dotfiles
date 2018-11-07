#!/bin/bash
sudo fallocate -l 80G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile none            swap    sw              0       0" >> /etc/fstab
