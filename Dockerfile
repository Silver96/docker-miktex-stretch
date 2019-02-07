FROM debian:stretch-slim
RUN apt-get update
RUN apt-get install gnupg gnupg1 gnupg2 apt-transport-https ca-certificates -y

RUN apt-key adv --no-tty --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
RUN echo "deb http://miktex.org/download/debian stretch universe" | tee /etc/apt/sources.list.d/miktex.list

RUN apt-get update
RUN apt-get install -y --no-install-recommends miktex perl

RUN miktexsetup --shared=yes finish
RUN initexmf --set-config-value=[MPM]AutoInstall=1

RUN useradd -m user
USER user

WORKDIR /user
