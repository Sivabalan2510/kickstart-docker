# Docker image to use.
FROM sloopstash/base:v1.1.1

# Install JDK 17
WORKDIR /tmp
RUN set -x \
  && wget https://download.oracle.com/java/17/archive/jdk-17.0.12_linux-x64_bin.tar.gz \
  && tar xvzf jdk-17.0.12_linux-x64_bin.tar.gz \
  && rm jdk-17.0.12_linux-x64_bin.tar.gz

# Envirnoment path Logstash Java path and Logstash Path
ENV LS_JAVA_HOME=/jdk-17.0.12
ENV PATH=$PATH:/usr/share/logstash/bin

# Install Logstash V18.6
RUN set -x \
  && wget https://artifacts.elastic.co/downloads/logstash/logstash-8.16.0-linux-x86_64.tar.gz \
  && tar xvzf logstash-8.16.0-linux-x86_64.tar.gz \
  && rm logstash-8.16.0-linux-x86_64.tar.gz

# Create Logstash directories.
RUN set -x \
  && mkdir /opt/logstash \
  && mkdir /opt/logstash/data \
  && mkdir /opt/logstash/log \
  && mkdir /opt/logstash/conf \
  && mkdir /opt/logstash/script \
  && mkdir /opt/logstash/system \
  && touch /opt/logstash/system/server.pid \
  && touch /opt/logstash/system/supervisor.ini \
  && ln -s /opt/logstash/system/supervisor.ini /etc/supervisord.d/logstash.ini \
  && history -c

# Set the working directory for Logstash
WORKDIR /opt/logstash
