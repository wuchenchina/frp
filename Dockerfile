FROM ubuntu:22.04

WORKDIR /data

RUN sed -ri.bak -e 's/\/\/.*?(archive.ubuntu.com|mirrors.*?)\/ubuntu/\/\/mirrors.aliyun.com\/ubuntu/g' -e '/security.ubuntu.com\/ubuntu/d' /etc/apt/sources.list

RUN apt-get update -y ; apt-get install -y wget git tar gzip

RUN wget https://github.com/fatedier/frp/releases/download/v0.62.1/frp_0.62.1_linux_amd64.tar.gz

RUN tar -xzf frp_0.62.1_linux_amd64.tar.gz

RUN mv frp_0.62.1_linux_amd64/* .

RUN rm -rf frp_0.62.1_linux_amd64.tar.gz frp_0.62.1_linux_amd64

RUN chmod +x *

RUN mkdir -p config

CMD ["./frps", "-c", "./config/frps.ini"]