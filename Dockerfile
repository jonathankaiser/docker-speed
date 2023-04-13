FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04 
ENV TZ=Europe/Minsk
ENV DEBIAN_FRONTEND=noninteractive
ENV CUDA_HOME=/usr/local/cuda-11.4
RUN apt-get update && apt upgrade -y
RUN apt-get install -y ffmpeg
RUN apt-get install -y wget
RUN apt-get install -y build-essential
RUN apt-get install -y vim
RUN apt-get install -y unzip
RUN apt-get install -y git
RUN apt-get install -y libcudnn8
RUN apt-get install -y libglfw3-dev libgles2-mesa-dev
RUN apt-get install -y nvidia-cuda-toolkit
