ARG ALERTMANAGER_VERSION=v0.27.0

FROM prom/alertmanager:${ALERTMANAGER_VERSION}

USER root

COPY alertmanager.yml /etc/alertmanager/alertmanager.yml
COPY entrypoint.sh /etc/alertmanager/entrypoint.sh

RUN chmod +x /etc/alertmanager/entrypoint.sh

ENTRYPOINT ["/etc/alertmanager/entrypoint.sh"]
