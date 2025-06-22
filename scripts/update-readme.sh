#!/bin/bash

# 获取 images 目录下的所有实际图片文件
IMAGES=($(ls images/whole_body-*.{png,jpg,jpeg,gif} 2>/dev/null))

# 如果没有找到图片，则退出以避免错误
if [ ${#IMAGES[@]} -eq 0 ]; then
  echo "No images found in images/ directory matching whole_body-*. Exiting."
  exit 1
fi

# 从图片数组中随机选择一个
RANDOM_IMAGE=${IMAGES[$RANDOM % ${#IMAGES[@]}]}

# 使用 sed 直接更新 README.md 中的图片 src 属性
# 这个命令会查找 alt='看板娘' 的 img 标签，并将其 src 替换为新的随机图片路径
# This is a safer way to replace the image source without creating a temporary file.
sed -i "s|src='[^']*/images/[^']*.png[^']*'\(.*alt='看板娘'\)|src='./$RANDOM_IMAGE'\1|g" README.md
