FROM paddlecloud/paddledetection:2.4-cpu-e9a542

LABEL name="paddle"

RUN rm -rf /home/PaddleDetection
RUN git clone https://gitee.com/formero/paddle_detection_vehicle.git /home/PaddleDetection
RUN cd /home/PaddleDetection && pip install -r requirements.txt -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
RUN python setup.py install
RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.aliyun.com@g" /etc/apt/sources.list && sed -i "s@http://.*security.ubuntu.com@http://mirrors.aliyun.com@g" /etc/apt/sources.list
RUN apt update && apt install ffmpeg -y

WORKDIR /home/PaddleDetection