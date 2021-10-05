#!/bin/bash

apt -y install python3 python3-venv python3-dev nginx git

git clone https://github.com/Azure-Samples/azure-stack-hub-flask-hello-world.git
cd azure-stack-hub-flask-hello-world

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

export FLASK_APP=application.py
# export FLASK_DEBUG=1 
flask run -h 0.0.0.0