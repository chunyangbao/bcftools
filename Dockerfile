FROM ubuntu:16.04

RUN apt-get update && \
     apt-get upgrade -y && \
     apt-get install -y wget curl unzip gcc g++ make git zlib zlib-devel autoconf

# bcftools
RUN mkdir /samtools
WORKDIR /samtools

RUN git clone git://github.com/samtools/htslib.git && \
     git clone git://github.com/samtools/bcftools.git && \
     cd bcftools && \
     make

WORKDIR /
