FROM debian:11.3-slim
RUN apt-get update \
&& apt-get install -y curl tar gcc make m4 libncurses-dev
