FROM ubuntu:22.04

WORKDIR /data

RUN sed -ri.bak -e 's/\/\/.*?(archive.ubuntu.com|mirrors.*?)\/ubuntu/\/\/mirrors.aliyun.com\/ubuntu/g' -e '/security.ubuntu.com\/ubuntu/d' /etc/apt/sources.list

RUN apt-get update -y ; apt-get install -y wget git tar gzip

RUN wget https://vip.123pan.cn/1831704795/public/frp/v0.57.0/frp_0.57.0_linux_amd64.tar.gz

RUN tar -xzf frp_0.57.0_linux_amd64.tar.gz

RUN mv frp_0.57.0_linux_amd64/* .

RUN rm -rf frp_0.57.0_linux_amd64.tar.gz frp_0.57.0_linux_amd64

RUN chmod +x *

RUN mkdir -p config

CMD ["./frps", "-c", "./config/frps.json"]