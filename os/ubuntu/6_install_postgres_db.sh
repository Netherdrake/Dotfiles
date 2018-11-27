#!/bin/bash

sudo apt-get install -y postgresql postgresql-contrib

# create a superuser for current user
username = $USER
sudo su - postgres
createuser $(username) -d -s -i
