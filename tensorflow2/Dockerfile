FROM tensorflow/tensorflow:nightly-jupyter
MAINTAINER Stevie https://github.com/yzm629

ADD ./pip.conf /root/.pip/pip.conf

RUN pip install jupyter_contrib_nbextensions && \
	jupyter contrib nbextension install --user && \
	pip install jupyter_nbextensions_configurator && \
	jupyter nbextensions_configurator enable --user && \
	pip install tensorlayer numpy matplotlib
