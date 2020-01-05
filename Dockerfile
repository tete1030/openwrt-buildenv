FROM ubuntu:18.04
RUN useradd -ms /bin/bash builder \
  && apt-get -qq update && apt-get -qq install sudo \
  && /bin/bash -c 'echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/99_sudo_include_file'
USER builder
WORKDIR /home/builder
ENV TERM=screen
RUN --mount=type=bind,src=initenv.sh,dest=initenv.sh initenv.sh
