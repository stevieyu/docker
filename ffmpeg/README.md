```sh
# 视频分辨率转换
docker run --rm -it -v $PWD:/root/data ffmpeg -i input.mp4 -s 480x360 output.mp4

# 视频编码转换
docker run --rm -it -v $PWD:/root/data ffmpeg -i input.mp4 -c:v libx264 output.mp4
```