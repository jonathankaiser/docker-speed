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








WORKDIR /

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py39_22.11.1-1-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

COPY . ./
WORKDIR /slahmr

RUN conda create -n slahmr python=3.9 -y
RUN conda run -n slahmr --live-stream conda install suitesparse -c conda-forge -y
RUN --mount=type=cache,target=/opt/conda/pkgs conda run -n slahmr --live-stream conda install pytorch=1.13.0 torchvision=0.14.0 pytorch-cuda=11.7 -c pytorch -c nvidia -y
#RUN conda run -n slahmr --live-stream pip install torch-scatter -f https://data.pyg.org/whl/torch-1.13.0+cu117.html
