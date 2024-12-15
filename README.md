# CleanComfyuiImage autodl的镜像脚本

## 从仓库到镜像
* 初始化系统`CleanComfyuiImage/ComfyUI/installation/sys_init.sh`
* clone comfyui 并且安装依赖 `CleanComfyuiImage/ComfyUI/installation/sys_init.sh`
* 安装插件 `CleanComfyuiImage/ComfyUI/installation/custom_nodes.sh CleanComfyuiImage/ComfyUI/installation/custom_nodes_url.txt`
* copy `ComfyUI/autodl/启动器.ipynb` 到 root（根目录）下
* copy 配置文件 `ComfyUI/autodl/configs/extra_model_paths.yaml` 到 root（根目录）下的ComfyUI目录下

后续考虑封装成一个脚本