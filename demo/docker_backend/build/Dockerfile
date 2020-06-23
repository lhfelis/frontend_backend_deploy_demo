FROM ubuntu:focal
COPY sources.list /etc/apt/
RUN apt-get update && apt-get install -y \
  supervisor \
  python3 \
  python3-pip \
  libmysqlclient-dev \
  iproute2 \
  inetutils-ping \
  netcat
RUN pip3 install gunicorn -i https://pypi.tuna.tsinghua.edu.cn/simple/
COPY requirements.txt /root
RUN pip3 install -r /root/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/
ENTRYPOINT ["bash", "/root/command.sh"]
