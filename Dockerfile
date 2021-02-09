FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London" THEME="agnoster" 
ENV PLUGINS="git docker-compose dotenv bundler ruby rbenv direnv"
ENV OH_MY_NEOVIM_EXTENSIONS="default ansible code_style coffee git go iconsjavascript json motion nodejs python ruby snippet spell sublime themes typescript undo vim web xml yaml mouse"
COPY ./install.sh ./
RUN bash install.sh 
COPY init.vim /root/config/nvim/
COPY ./neovim.sh ./
RUN bash -x neovim.sh
COPY ./startup.sh ./
WORKDIR /root
CMD [ "/startup.sh" ]