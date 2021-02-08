FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London" THEME="agnoster" 
ENV PLUGINS="git docker-compose dotenv bundler ruby rbenv direnv"
COPY ./install.sh ./
RUN bash install.sh

COPY ./startup.sh ./
WORKDIR /root
CMD [ "/startup.sh" ]