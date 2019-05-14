FROM zabbix/zabbix-server-mysql:ubuntu-3.0-latest
MAINTAINER Dmitri Mikhalyov
ARG APT_FLAGS_COMMON="-qq -y"
ARG APT_FLAGS_PERSISTANT="${APT_FLAGS_COMMON} --no-install-recommends"
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8 DEBIAN_FRONTEND=noninteractive TERM=xterm

RUN apt-get ${APT_FLAGS_COMMON} update && \
    apt-get ${APT_FLAGS_PERSISTANT} install curl && \
    apt-get ${APT_FLAGS_PERSISTANT} install dnsutils && \
    apt-get ${APT_FLAGS_PERSISTANT} install nmap && \
    apt-get ${APT_FLAGS_PERSISTANT} install ssh && \
    apt-get ${APT_FLAGS_COMMON} clean && \
    rm -rf /var/lib/apt/lists/*


