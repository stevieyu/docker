FROM python:3.7

WORKER /root

# https://github.com/PaddlePaddle/PaddleSpeech/pull/2249
RUN sed -i 's#deb.debian.org#mirrors.cloud.tencent.com#g' /etc/apt/sources.list && \
	apt update && \
	apt install libsndfile1 && \
	pip config set global.index-url http://mirror.baidu.com/pypi/simple && \
	pip config set global.trusted-host mirror.baidu.com && \
	pip install paddlepaddle && \
	pip install pytest-runner && \
	pip install paddlespeech && \
	wget -P data https://paddlespeech.bj.bcebos.com/Parakeet/tools/nltk_data.tar.gz && \
	tar zxvf data/nltk_data.tar.gz && \
	paddlespeech tts --am fastspeech2_mix --voc hifigan_csmsc --lang mix --spk_id 174 --input "你好，欢迎使用百度飞桨深度学习框架！" --output /root/output.wav
