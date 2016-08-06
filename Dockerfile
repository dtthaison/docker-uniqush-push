FROM ubuntu:14.04.4

ENV UNIQUSH_PUSH_VERSION=2.1.0

RUN apt-get update && apt-get -q -y install redis-server wget monit \
    && cd /tmp \
    && wget https://uniqush.org/downloads/uniqush-push_${UNIQUSH_PUSH_VERSION}_amd64.deb \
    && dpkg -i uniqush-push_${UNIQUSH_PUSH_VERSION}_amd64.deb

ENV PORT 9898

COPY root /

EXPOSE $PORT

CMD ["/bin/sh", "/opt/uniqush/bin/start.sh"]
