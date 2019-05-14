FROM zabbix/zabbix-agent:ubuntu-3.0-latest
MAINTAINER Dmitri Mikhalyov
ARG APT_FLAGS_COMMON="-qq -y"
ARG APT_FLAGS_PERSISTANT="${APT_FLAGS_COMMON} --no-install-recommends"
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8 DEBIAN_FRONTEND=noninteractive TERM=xterm

RUN sed -i '/user =/s/zabbix/root/' /etc/supervisor/conf.d/supervisord_zabbix.conf && \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
 echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
 apt-get ${APT_FLAGS_COMMON} update && \
 apt-get ${APT_FLAGS_COMMON} install mongodb-org-shell && \
 apt-get ${APT_FLAGS_COMMON} clean && \
 rm -rf /var/lib/apt/lists/*

