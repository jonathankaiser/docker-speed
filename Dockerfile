FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04 
ENV TZ=Europe/Minsk
ENV DEBIAN_FRONTEND=noninteractive
ENV CUDA_HOME=/usr/local/cuda-11.4
RUN apt-get update && apt upgrade -y
RUN apt-get install -y ffmpeg
