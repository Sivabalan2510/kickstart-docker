# Docker image to use.
FROM sloopstash/base:v1.1.1

# Install Kibana
WORKDIR /tmp
RUN set -x \
  && curl -O https://artifacts.elastic.co/downloads/kibana/kibana-8.16.0-linux-x86_64.tar.gz --quiet \
  && curl -O https://artifacts.elastic.co/downloads/kibana/kibana-8.16.0-linux-x86_64.tar.gz.sha512 \
  && sha512sum -c kibana-8.16.0-linux-x86_64.tar.gz.sha512 \
  && tar -xzf kibana-8.16.0-linux-x86_64.tar.gz
    cd kibana-8.16.0/
    ./bin/kibana
