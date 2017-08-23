FROM debian:stable
ARG VERSION=0.11.4
ENV USER=git
RUN apt update && apt install --no-install-recommends git \
    wget \
    tar \
    openssh-client \
    ca-certificates -y && \
    wget https://dl.gogs.io/${VERSION}/linux_amd64.tar.gz -O /tmp/gogs.tar.gz && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init && \
    useradd -r -m git -u 1000 && \
    chmod +x /usr/local/bin/dumb-init && \
    rm -rf /var/lib/apt/lists/* && \
    apt purge wget ca-certificates -y 

USER git
RUN tar xf /tmp/gogs.tar.gz -C /home/git/ && \
    chmod +x /home/git/gogs && \
    mkdir -p /home/git/gogs/custom/data/ssh

WORKDIR /home/git/gogs
ENTRYPOINT ["/usr/local/bin/dumb-init","/home/git/gogs/gogs","web"]
