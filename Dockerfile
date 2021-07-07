FROM ubuntu:latest

RUN apt update && apt install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt update && apt install -y neovim

RUN apt install -y python3-dev python3-pip
RUN pip3 install pynvim

RUN apt install -y git curl
RUN apt install -y nodejs

RUN mkdir -p $HOME/.config/nvim

CMD bash



