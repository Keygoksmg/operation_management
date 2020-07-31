FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y sudo \
	python3-pip \
	nodejs npm\
	language-pack-ja

# Install python packages
RUN pip3 install --upgrade pip && pip3 install -U jupyterlab \
	networkx \
	numpy \
	pandas \
	powerlaw \
	matplotlib \
	pyintergraph \
	scipy \
	sklearn \
	tqdm

#Install graph-tool
RUN apt-get update && apt-get install --yes --no-install-recommends \
	gnupg2 \
	ca-certificates
RUN echo "deb [ arch=amd64 ] https://downloads.skewed.de/apt bionic main" >> /etc/apt/sources.list
RUN apt-key adv --no-tty --keyserver keys.openpgp.org --recv-key 612DEFB798507F25
RUN apt-get update && apt-get install --yes --no-install-recommends \
	python3-graph-tool=2.31-2

# The packages t ouse graphtool
RUN sudo apt-get install -y libgtk-3-dev

# Install pycairo
RUN sudo apt install -y libcairo2-dev pkg-config python3-dev && \
	pip3 install pycairo

