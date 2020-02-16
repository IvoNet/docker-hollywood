FROM ubuntu:18.04
LABEL maintainer="Ivo Woltring @ivonet"

RUN apt-get update \
 && apt-get install -y --no-install-recommends software-properties-common \
 &&	add-apt-repository ppa:hollywood/ppa \
 &&	apt-get update \
 &&	apt-get install -y --no-install-recommends \
  	hollywood \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* \
 && updatedb

ENV HOME /home/busyguy
RUN useradd --create-home --home-dir $HOME busyguy \
	&& chown -R busyguy:busyguy $HOME

WORKDIR $HOME
USER busyguy

CMD [ "hollywood" ]
