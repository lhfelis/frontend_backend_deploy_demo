FROM haproxy
COPY sources.list /etc/apt/
RUN apt-get update && apt-get install -y \
  keepalived \
  procps \
  netcat