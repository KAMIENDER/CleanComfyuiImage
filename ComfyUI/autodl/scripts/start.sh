#! /bin/bash

echo "启动中……"

source /etc/network_turbo

#git config --global http.proxy $http_proxy
#echo 'git 配置好了'

if [ "$1" = "global" ]; then
  echo '开启全局配置'

  if pgrep calm > /dev/null
  then
    echo "calm is already running"
  else
    echo "starting calm"
    cd /root/calm

    if ! [ -e "config.yaml" ]; then
      cp /root/CleanComfyuiImage/common/configs/calm_config.yaml ./config.yaml
      server=$(echo $http_proxy | sed 's/http:\/\/\([^:]*\):.*/\1/')
      port=$(echo $http_proxy | sed 's/.*:\([0-9]*\)$/\1/')
      sed -i "s/server_address/$server/g" config.yaml
      sed -i "s/server_port/$port/g" config.yaml
    fi
    nohup ./calm -f config.yaml &
  fi

  export http_proxy=http://127.0.0.1:7890
  export https_proxy=http://127.0.0.1:7890
  #export no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
fi

output_dir="/root/autodl-tmp/output"
if [ ! -d $output_dir ]; then
  ln -s /root/ComfyUI/output $output_dir
fi

# models_dir="/root/autodl-fs/models"
# ln -s /root/autodl-fs/models/root/Comfyui/models


echo "ollama 启动"
ollama serve &

cd /root/ComfyUI

source /root/CleanComfyuiImage/common/scripts/init-proxy.sh && \
HF_ENDPOINT=https://hf-mirror.com \
python main.py --port 6006 --listen 0.0.0.0
