FROM ubuntu:16.04

RUN apt-get update && \
     apt-get upgrade -y && \
     apt-get install -y build-essential autoconf zlib1g-dev libbz2-dev liblzma-dev git

# bcftools
RUN mkdir /samtools
WORKDIR /samtools

RUN git clone git://github.com/samtools/htslib.git && \
     git clone git://github.com/samtools/bcftools.git && \
     cd bcftools && \
     make && \
     make install

RUN export BCFTOOLS_PLUGINS=/samtools/bcftools/plugins

WORKDIR /
