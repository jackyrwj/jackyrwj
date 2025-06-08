#!/bin/bash

# 获取随机图片
IMAGES=($(ls images/*.{png,jpg,jpeg,gif} 2>/dev/null))

# 使用时间戳作为随机种子
RANDOM_SEED=$(date +%s)
RANDOM=$RANDOM_SEED

# 随机选择一个图片
RANDOM_IMAGE=${IMAGES[$RANDOM % ${#IMAGES[@]}]}

# 复制随机图片为 current.png
cp "$RANDOM_IMAGE" "images/current.png"

# 更新 README.md
TIMESTAMP=$(date +%s)
RANDOM_NUM=$((RANDOM % 1000))
sed -i "s|src='./images/current.png'|src='./images/current.png?v=${TIMESTAMP}_${RANDOM_NUM}'|" README.md
