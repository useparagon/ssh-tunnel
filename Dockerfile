FROM alpine:3.6

LABEL maintainer="ishmael@useparagon.com"

RUN apk update && apk add openssh-client \
 && echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

ENV TUNNEL_HOST="" \
    TUNNEL_REMOTES=""

COPY start.sh /start.sh
COPY ssh-unlock.sh /ssh-unlock.sh

RUN chmod +x /start.sh
RUN chmod +x /ssh-unlock.sh

ENTRYPOINT []

CMD ["/bin/sh", "-c", "/start.sh"]