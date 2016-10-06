# Version: 0.0.1
FROM python:3.5
MAINTAINER Maria Patterson "maria.t.patterson@gmail.com"
ENV REFRESHED_AT 2016-10-05

WORKDIR /home
RUN git clone https://github.com/edenhill/librdkafka.git && cd librdkafka && git checkout 0.9.1
WORKDIR /home/librdkafka
RUN ./configure && make && make install
ENV LD_LIBRARY_PATH /usr/local/lib

RUN pip install confluent-kafka
RUN pip install avro-python3

WORKDIR /home
