FROM ubuntu:18.04
LABEL maintainer="Ivo Woltring <webmaster@ivonet.nl>"

RUN apt-get update \
 && apt-get install -y --no-install-recommends software-properties-common \
 &&	add-apt-repository ppa:hollywood/ppa \
 &&	apt-get update \
 &&	apt-get install -y --no-install-recommends \
 &&	hollywood \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/*

ENV HOME /home/busyguy
RUN useradd --create-home --home-dir $HOME busyguy \
	&& chown -R busyguy:busyguy $HOME

WORKDIR $HOME
USER busyguy

CMD [ "hollywood" ]
