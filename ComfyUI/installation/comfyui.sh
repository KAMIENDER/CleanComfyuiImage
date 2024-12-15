#!/bin/bash

source /etc/network_turbo
cd ~

git clone --depth 1 https://github.com/comfyanonymous/ComfyUI

cd ~/ComfyUI
pip install -r requirements.txt
