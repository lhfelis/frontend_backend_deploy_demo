FROM nginx:1.19.0
COPY sources.list /etc/apt/
RUN apt-get update && apt-get install -y \
  keepalived \
  procps \
  netcat
