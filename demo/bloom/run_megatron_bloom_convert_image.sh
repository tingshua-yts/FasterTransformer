#!/bin/bash
set -x
name=bloom_megatron_ft_convert
#image=bloom-7b-pai:05-25
image=ai-studio-registry-vpc.cn-beijing.cr.aliyuncs.com/kube-ai/gpt-neox:0.0.2
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
