#!/bin/bash
set -x
name=ft_convert
image=ai-studio-registry-vpc.cn-beijing.cr.aliyuncs.com/kube-ai/pytorch:1.11.0-cuda11.3-cudnn8-runtime
workspace=`pwd`
flag=$(sudo docker ps  | grep "$name" | wc -l)
if [ $flag == 0 ]
then
    sudo nvidia-docker stop "$name"
    sudo nvidia-docker rm "$name"
    sudo nvidia-docker run --name="$name" -d --network=host \
	 -v /mnt:/mnt \
	 --ipc=host \
    -w $workspace   -it $image /bin/bash
fi
sudo docker exec -it "$name" bash
