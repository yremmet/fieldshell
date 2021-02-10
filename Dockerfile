FROM ubuntu:20.04

EXPOSE 8090
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London" THEME="agnoster" 
ENV PLUGINS="git docker-compose dotenv bundler ruby rbenv direnv"
ENV OH_MY_NEOVIM_EXTENSIONS="default ansible code_style coffee git go iconsjavascript json motion nodejs python ruby snippet spell sublime themes typescript undo vim web xml yaml mouse"
ENV CODE_SERVER_PORT=8090 CODE_SERVER_PASSWORD="code-server"
COPY ./install.sh ./
RUN bash install.sh 
COPY init.vim /root/.config/nvim/
COPY ./config.yaml /root/.config/code-server/config.yaml
COPY ./neovim.sh ./
RUN bash -x neovim.sh
COPY ./startup.sh ./
WORKDIR /root
CMD [ "/startup.sh" ]