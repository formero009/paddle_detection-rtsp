本项目基于百百度飞浆的PaddleDetection，将预测结果以推送到了rtsp流媒体，可以实时看到预测画面
完全基于容器运行

###一、构建镜像并运行
在本目录下运行
docker-compose up -d

###二、推流
#####可以使用手机直播的形式推流或者是将mp4文件推流到流媒体,作为素材进行预测
####1)手机可以使用如下的连接进行推流，需要将xx替换为手机可以访问的流媒体地址(此处使用的是 [ZLMediaKit](https://github.com/ZLMediaKit/ZLMediaKit))
#####1.手机汽车推流到   <rtsp://xx.xx.xx.xx:38554/live/vehicle_in>
#####2.手机行人推流到   <rtsp://xx.xx.xx.xx:38554/live/human_in>

####2)程序推流本地mp4文件
直接在本目录下运行如下命令：
######(1) 推汽车测试流
./ffmpeg/bin/ffmpeg.exe -re -stream_loop -1 -i mp4/road_low.mp4 -vcodec copy -acodec copy -f rtsp -rtsp_transport tcp rtsp://127.0.0.1:38554/live/vehicle_in

######(2) 推行人测试流
./ffmpeg/bin/ffmpeg.exe -re -stream_loop -1 -i mp4/humans_low.mp4 -vcodec copy -acodec copy -f rtsp -rtsp_transport tcp rtsp://127.0.0.1:38554/live/human_in

###三、预测
分别运行预测行人或预测车辆文本中的命令进行预测（需要首先成功推流）