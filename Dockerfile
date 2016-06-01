FROM ubuntu:14.04
MAINTAINER yookuda <yookuda@nig.ac.jp>
RUN apt-get update && \
    apt-get install -y bioperl && \
    apt-get clean
RUN mkdir /data
