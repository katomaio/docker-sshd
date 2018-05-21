FROM katoma/base:latest
MAINTAINER Katoma

# S6 Settings
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

COPY root/ /

RUN apk add --no-cache \
      fail2ban \
      sudo \
      vim \
      bash \
      openssh \
    && chmod +x /etc/services.d/*/run /etc/cont-init.d/* \
    && rm /etc/fail2ban/jail.d/alpine-ssh.conf \
    && mkdir -p /defaults/fail2ban \
    && mv /etc/fail2ban/action.d /defaults/fail2ban/ \
    && mv /etc/fail2ban/filter.d /defaults/fail2ban/


EXPOSE 22

ENTRYPOINT ["/init"]
